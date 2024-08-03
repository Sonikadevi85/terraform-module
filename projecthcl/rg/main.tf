resource "azurerm_resource_group" "hclrg" {
  for_each = var.hclvarrg
  name     = each.value.name
  location = each.value.location
}