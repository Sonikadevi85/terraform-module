resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.hclvm
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  disable_password_authentication = false
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.password[each.key].value
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}