resource "azurerm_linux_virtual_machine" "vm-b" {
  for_each            = var.vm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  admin_username = var.admin_username
admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic-data-b[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}