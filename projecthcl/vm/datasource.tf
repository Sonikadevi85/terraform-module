data "azurerm_network_interface" "nic" {
  for_each            = var.hclvm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
data "azurerm_key_vault" "key" {
  
  name                = "hclkey"
  resource_group_name = "hclrg1"
}
data "azurerm_key_vault_secret" "username" {
  for_each = var.hclvm
  name         = each.value.username_name
  key_vault_id = data.azurerm_key_vault.key.id
}
data "azurerm_key_vault_secret" "password" {
  for_each = var.hclvm
  name         = each.value.password_name
  key_vault_id = data.azurerm_key_vault.key.id
}