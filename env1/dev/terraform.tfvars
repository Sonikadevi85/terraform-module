hclvarrg = {
  rg1 = { name = "hclrg1"
    location = "eastus"
  }
}
hclvnet = {
  vnet1 = {
    name                = "hclvnet"
    location            = "eastus"
    resource_group_name = "hclrg1"
    address_space       = ["10.0.0.0/16"]
  }
  

}
hclsubnet = {
  snet1 = {
    name                 = "subnet1"
    resource_group_name  = "hclrg1"
    virtual_network_name = "hclvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "subnet2"
    resource_group_name  = "hclrg1"
    virtual_network_name = "hclvnet"
    address_prefixes     = ["10.0.12.0/24"]
  }
  snet3 = {
    name                 = "subnet3"
    resource_group_name  = "hclrg1"
    virtual_network_name = "hclvnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
hclnic = {
  nic1 = {
    nic_name                      = "hclnic1"
    location                      = "eastus"
    resource_group_name           = "hclrg1"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "subnet1"
    vnet_name                     = "hclvnet"
  }
  nic2 = {
    nic_name                      = "hclnic2"
    location                      = "eastus"
    resource_group_name           = "hclrg1"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "subnet2"
    vnet_name                     = "hclvnet"
  }
  
}
hclpip = {
  pip1 = {
    name                = "hclpip1"
    resource_group_name = "hclrg1"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "hclpip2"
    resource_group_name = "hclrg1"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip3 = {
    name                = "hclpip2"
    resource_group_name = "hclrg1"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
hclkeyvault = {
  hclkey1 = {
    name                        = "hclkey"
    location                    = "eastus"
    rg_name                     = "hclrg1"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
  hclkey2 = {
    name                        = "hclkey"
    location                    = "eastus"
    rg_name                     = "hclrg1"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
}
hclbastion = {
  hclbastion1 = {
    name              = "AzureBastionSubnet"
    bastion_name      = "bastion_host"
    location          = "eastus"
    ip_name           = "public_ip"
    data_subnet_name  = "subnet1"
    rg_name           = "hclrg1"
    vnet_name         = "hclvnet1"
    pip_name          = "bastionpip"
    address_prefixes  = ["10.0.3.0/24"]
    sku               = "Standard"
    allocation_method = "Static"
  }
}
hclvm = {
  vm1 = {
    name                 = "HCLvm1"
    rg_name              = "hclrg1"
    location             = "eastus"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nic_name             = "hclnic1"
    username_name="username"
    password_name="password"
    keyvalt_name="hclkey"
  }
  vm2 = {
    name                 = "HCLvm2"
    rg_name              = "hclrg1"
    location             = "eastus"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nic_name             = "hclnic2"
    username_name="username2"
    password_name="password2"
    keyvalt_name="hclkey"
  }
}