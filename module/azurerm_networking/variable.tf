variable "networks" {
  type = map(object({
    name              = string
  address_space       = list(string)
  location            = string
  resource_group_name = string
  snet = list(object({
    name = string
address_prefixes = list(string)
  }))


}))
}


