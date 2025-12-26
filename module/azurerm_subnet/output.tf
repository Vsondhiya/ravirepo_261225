output "subnet_id" {
  value = { for k, v in azurerm_subnet.snet : k => v.id }
}
