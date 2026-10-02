rg = {
  rg-1-dev = {
    name     = "rg-1-dev"
    location = "East US"
  }
  rg-2-dev = {
    name     = "rg-2-dev"
    location = "Central US"
  }
}
vnet = {
  vnet-dev = {
    name                = "vnet-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet-dev"
    resource_group_name  = "rg-1-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet-dev"
    resource_group_name  = "rg-1-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "database-subnet-dev"
    resource_group_name  = "rg-1-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-1-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-1-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.5.0/24"]
  }
}
nsg = {
  nsg1 = {
    name                = "nsg-1-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
  }
  nsg2 = {
    name                = "nsg-2-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
  }
}
pip = {
  pip1 = {
    name                = "bastion-pip-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "appgw-pip-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "lb-pip-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    allocation_method   = "Static"
  }
}
nic = {
  nic1 = {
    name                 = "frontend-nic-dev"
    location             = "East US"
    resource_group_name  = "rg-1-dev"
    nsg_name             = "nsg-1-dev"
    subnet_name          = "frontend-subnet-dev"
    virtual_network_name = "vnet-dev"
  }
  nic2 = {
    name                 = "backend-nic-dev"
    location             = "East US"
    resource_group_name  = "rg-1-dev"
    nsg_name             = "nsg-2-dev"
    subnet_name          = "backend-subnet-dev"
    virtual_network_name = "vnet-dev"
  }
}
vm = {
  vm1 = {
    name                = "frontend-vm-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "frontend-nic-dev"
  }
  vm2 = {
    name                = "backend-vm-dev"
    location            = "East US"
    resource_group_name = "rg-1-dev"
    size                = "Standard_D2a_v4"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    nic_name            = "backend-nic-dev"
  }
}
lb = {
  lb1 = {
    name                 = "lb1"
    location             = "East US"
    resource_group_name  = "rg-1-dev"
    sku                  = "Standard"
    virtual_network_name = "vnet-dev"
    lb_pip_name          = "lb-pip-dev"
  }
}
kv = {
  kv1 = {
    name                = "kv85123"
    location            = "East US"
    resource_group_name = "rg-1-dev"
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
    resource_group_name  = "rg-1-dev"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev"
    bastion_pip_name     = "bastion-pip-dev"
  }
}

appgw = {
  appgw1 = {
    name                 = "appgw1"
    location             = "East US"
    resource_group_name  = "rg-1-dev"
    subnet_name          = "AppGatewaySubnet"
    virtual_network_name = "vnet-dev"
    PIP_name             = "appgw-pip-dev"
  }
}

sql = {
  sql1 = {
    name                = "sqlserver-dev-arush-2026"
    location            = "Central US"
    resource_group_name = "rg-2-dev"
    version             = "12.0"
    dbname              = "database-dev"

  }
}