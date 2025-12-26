variable "vm" {
  type = map(object({
     name                  = string
  location              = string
  resource_group_name   = string
  size                  = string
   admin_username = string
  admin_password = string 
  nic_key  = string
  nsg_key  = string
disable_password_authentication = bool
  }))
} 

variable "nsg" {
  type = map(object({
    name                = string
  location            = string
  resource_group_name = string
  }))
}

variable "nic_id" {
  type = map(string)
  
}

variable "nsg_id" {
    type = map(string)
}