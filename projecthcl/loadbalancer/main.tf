resource "azurerm_lb" "load" {
 for_each = var.lb
  name                = each.value.lb_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = each.value.pip_name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}