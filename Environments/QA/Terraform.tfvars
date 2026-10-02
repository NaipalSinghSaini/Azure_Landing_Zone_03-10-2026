rg = {
  rg-1-QA = {
    name     = "rg-1-QA"
    location = "East US"
  }
  rg-2-QA = {
    name     = "rg-2-QA"
    location = "Central US"
  }
}
vnet = {
  vnet-QA = {
    name                = "vnet-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet-QA"
    resource_group_name  = "rg-1-QA"
    virtual_network_name = "vnet-QA"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet-QA"
    resource_group_name  = "rg-1-QA"
    virtual_network_name = "vnet-QA"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "database-subnet-QA"
    resource_group_name  = "rg-1-QA"
    virtual_network_name = "vnet-QA"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-1-QA"
    virtual_network_name = "vnet-QA"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-1-QA"
    virtual_network_name = "vnet-QA"
    address_prefixes     = ["10.0.5.0/24"]
  }
}
nsg = {
  nsg1 = {
    name                = "nsg-1-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
  }
  nsg2 = {
    name                = "nsg-2-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
  }
}
pip = {
  pip1 = {
    name                = "bastion-pip-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "appgw-pip-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "lb-pip-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    allocation_method   = "Static"
  }
}
nic = {
  nic1 = {
    name                 = "frontend-nic-QA"
    location             = "East US"
    resource_group_name  = "rg-1-QA"
    nsg_name             = "nsg-1-QA"
    subnet_name          = "frontend-subnet-QA"
    virtual_network_name = "vnet-QA"
  }
  nic2 = {
    name                 = "backend-nic-QA"
    location             = "East US"
    resource_group_name  = "rg-1-QA"
    nsg_name             = "nsg-2-QA"
    subnet_name          = "backend-subnet-QA"
    virtual_network_name = "vnet-QA"
  }
}
vm = {
  vm1 = {
    name                = "frontend-vm-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "frontend-nic-QA"
  }
  vm2 = {
    name                = "backend-vm-QA"
    location            = "East US"
    resource_group_name = "rg-1-QA"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "backend-nic-QA"
  }
}
lb = {
  lb1 = {
    name                 = "lb1"
    location             = "East US"
    resource_group_name  = "rg-1-QA"
    sku                  = "Standard"
    virtual_network_name = "vnet-QA"
    lb_pip_name          = "lb-pip-QA"
  }
}
kv = {
  kv1 = {
    name                = "kv85123"
    location            = "East US"
    resource_group_name = "rg-1-QA"
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
    resource_group_name  = "rg-1-QA"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-QA"
    bastion_pip_name     = "bastion-pip-QA"
  }
}

appgw = {
  appgw1 = {
    name                 = "appgw1"
    location             = "East US"
    resource_group_name  = "rg-1-QA"
    subnet_name          = "AppGatewaySubnet"
    virtual_network_name = "vnet-QA"
    PIP_name             = "appgw-pip-QA"
  }
}

sql = {
  sql1 = {
    name                = "sqlserver-QA-arush-2026"
    location            = "Central US"
    resource_group_name = "rg-2-QA"
    version             = "12.0"
    dbname              = "database-QA"

  }
}
