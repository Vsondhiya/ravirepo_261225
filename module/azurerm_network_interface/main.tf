resource "azurerm_network_interface" "network_nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name      = "internal"
    subnet_id = var.subnet_id[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}
