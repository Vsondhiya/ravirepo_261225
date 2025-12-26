module "resource_group" {
source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network_name" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_vnet"

  networks = var.networks
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  public_ip  = var.public_ip
}

module "kv" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  kv         = var.kv
  # key_vault_id = var.key_vault_id[each.value.kv_key]
}



module "subnet" {
  depends_on = [module.virtual_network_name]
  source     = "../../module/azurerm_subnet"
  snet       = var.snet
}

module "network_interface" {
  depends_on = [module.subnet] #yaha pr mai bata raha hu mera pahle subnet ban jaye fir subnet ki id nic me use kr paaunga
  source     = "../../module/azurerm_network_interface"
  nic        = var.nic
  subnet_id  = module.subnet.subnet_id

}

module "compute" {
  depends_on = [module.network_interface]
  source     = "../../module/azurerm_compute"
  vm         = var.vm
  nic_id     = module.network_interface.nic_id
  nsg_id     = module.compute.nsg_id
  nsg        = var.nsg
}

module "azurerm_key_vault_secret" {
  depends_on      = [module.kv]
  source          = "../../module/azurerm_secret"
  secret_username = var.secret_username
  secret_password = var.secret_password
  key_vault_id    = module.kv.key_vault_id
}