rg = {
  rg-1-Prod = {
    name     = "rg-1-Prod"
    location = "East US"
  }
  rg-2-Prod = {
    name     = "rg-2-Prod"
    location = "Central US"
  }
}
vnet = {
  vnet-Prod = {
    name                = "vnet-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet-Prod"
    resource_group_name  = "rg-1-Prod"
    virtual_network_name = "vnet-Prod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet-Prod"
    resource_group_name  = "rg-1-Prod"
    virtual_network_name = "vnet-Prod"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "database-subnet-Prod"
    resource_group_name  = "rg-1-Prod"
    virtual_network_name = "vnet-Prod"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-1-Prod"
    virtual_network_name = "vnet-Prod"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-1-Prod"
    virtual_network_name = "vnet-Prod"
    address_prefixes     = ["10.0.5.0/24"]
  }
}
nsg = {
  nsg1 = {
    name                = "nsg-1-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
  }
  nsg2 = {
    name                = "nsg-2-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
  }
}
pip = {
  pip1 = {
    name                = "bastion-pip-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "appgw-pip-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "lb-pip-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    allocation_method   = "Static"
  }
}
nic = {
  nic1 = {
    name                 = "frontend-nic-Prod"
    location             = "East US"
    resource_group_name  = "rg-1-Prod"
    nsg_name             = "nsg-1-Prod"
    subnet_name          = "frontend-subnet-Prod"
    virtual_network_name = "vnet-Prod"
  }
  nic2 = {
    name                 = "backend-nic-Prod"
    location             = "East US"
    resource_group_name  = "rg-1-Prod"
    nsg_name             = "nsg-2-Prod"
    subnet_name          = "backend-subnet-Prod"
    virtual_network_name = "vnet-Prod"
  }
}
vm = {
  vm1 = {
    name                = "frontend-vm-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "frontend-nic-Prod"
  }
  vm2 = {
    name                = "backend-vm-Prod"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "backend-nic-Prod"
  }
}
lb = {
  lb1 = {
    name                 = "lb1"
    location             = "East US"
    resource_group_name  = "rg-1-Prod"
    sku                  = "Standard"
    virtual_network_name = "vnet-Prod"
    lb_pip_name          = "lb-pip-Prod"
  }
}
kv = {
  kv1 = {
    name                = "kv85123"
    location            = "East US"
    resource_group_name = "rg-1-Prod"
    sku_name            = "standard"
    vm_username_secret  = "vm-admin-username"
    vm_password_secret  = "vm-admin-password"
    sql_username_secret = "sql-admin-username"
    sql_password_secret = "sql-admin-password"
  }
}
bastion = {
  bastion1 = {
    name                 = "bastion1"
    location             = "East US"
    resource_group_name  = "rg-1-Prod"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-Prod"
    bastion_pip_name     = "bastion-pip-Prod"
  }
}

appgw = {
  appgw1 = {
    name                 = "appgw1"
    location             = "East US"
    resource_group_name  = "rg-1-Prod"
    subnet_name          = "AppGatewaySubnet"
    virtual_network_name = "vnet-Prod"
    PIP_name             = "appgw-pip-Prod"
  }
}

sql = {
  sql1 = {
    name                = "sqlserver-Prod-arush-2026"
    location            = "Central US"
    resource_group_name = "rg-2-Prod"
    version             = "12.0"
    dbname              = "database-Prod"

  }
}
