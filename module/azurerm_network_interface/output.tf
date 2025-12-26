output "nic_id" {
  value = {
    for k, nic in azurerm_network_interface.network_nic : k => nic.id
  }
}