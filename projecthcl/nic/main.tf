resource "azurerm_network_interface" "nic" {
  for_each            = var.hclnic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
