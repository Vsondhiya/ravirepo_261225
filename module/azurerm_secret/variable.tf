variable "secret_username" {
  type = map(object({
    name         = string
  value        = string
  kv_key = string
  }))
}

variable "secret_password" {
  type = map(object({
    name         = string
  value        = string
  kv_key = string
  }))
}
variable "key_vault_id" {
  type = map(string)
}