data "azurerm_public_ip" "pip" {
  for_each            = var.lb
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku = each.value.sku
}