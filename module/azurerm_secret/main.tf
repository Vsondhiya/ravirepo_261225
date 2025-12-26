resource "azurerm_key_vault_secret" "username" {
    for_each = var.secret_username
  name         = each.value.name
  value        = each.value.value
  key_vault_id = var.key_vault_id[each.value.kv_key]
}

resource "azurerm_key_vault_secret" "password" {
    for_each = var.secret_password
  name         = each.value.name
  value        = each.value.value
  key_vault_id = var.key_vault_id[each.value.kv_key]
}