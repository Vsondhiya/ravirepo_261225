resource "azurerm_linux_virtual_machine" "test-vm" {
    for_each = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [var.nic_id[each.value.nic_key]]
  size                  = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}
resource "azurerm_network_security_group" "test-nsg" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*" 
    destination_address_prefix = "*"
  }
}
# Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each = var.vm
  network_interface_id     = var.nic_id[each.value.nic_key]

  network_security_group_id = var.nsg_id[each.value.nsg_key]
}