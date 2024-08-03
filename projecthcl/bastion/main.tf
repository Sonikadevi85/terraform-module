resource "azurerm_subnet" "bastion" {
  for_each             = var.hclbastion
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "bastion_pip" {
  for_each            = var.hclbastion
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "hclbastion" {
  for_each            = var.hclbastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = azurerm_subnet.bastion[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}