rgs = {
  rg1 = {
    name     = "rg-ravindra"
    location = "centralindia"
  }
}
networks = {
  vnet1 = {
    name                = "ravindra-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "centralindia"
    resource_group_name = "rg-ravindra"
  }
}

snet = {
   snet1= {
    name                 = "ravindra-snet"
    resource_group_name  = "rg-ravindra"
    virtual_network_name = "ravindra-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

public_ip = {
  pip1 = {
    name                = "amanpip"
    resource_group_name = "rg-ravindra"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    name                = "ravindra-nic"
    location            = "centralindia"
    resource_group_name = "rg-ravindra"
subnet_key          = "snet1"    
  }
}

nsg = {
  nsg1 = {
    name                = "ravindra-nsg"
    location            = "centralindia"
    resource_group_name = "rg-ravindra"
  }
}

vm = {
  vm1 = {
    name                            = "vm-ravindra"
    location                        = "centralindia"
    resource_group_name             = "rg-ravindra"
    size        = "Standard_F2"
    disable_password_authentication = false
    admin_username                  = "Useradmin"
    admin_password                  = "useradmin@123"
    nic_key                         = "nic1"
    nsg_key                         = "nsg1"
  }
}

kv = {
  kv1 = {
    name                = "kv-ravindra-123"
    location            = "centralindia"
    resource_group_name = "rg-ravindra"
    object_id           = "1301d1d4-d6c6-4963-8ee2-7d863e365945"
    tenant_id           = "5c09c46b-8034-4002-8418-77ce48be97db"
  }
}

secret_username = {
  user1 = {
    name   = "username"
    value  = "aman46788"
    kv_key = "kv1"
  }
}

secret_password = {
  pass1 = {
    name   = "password"
    value  = "Htipl@111"
    kv_key = "kv1"
  }
}