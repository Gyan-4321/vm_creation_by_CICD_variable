rg = {
  rg1 = {
    name     = "hp-rgtest"
    location = "Central India"

  }
}

vnet = {
  vnet1 = {
    name                = "hp-vnet"
    resource_group_name = "hp-rgtest"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]

  }
}

subnet = {
  subnet1 = {
    name                 = "hp-subnet"
    resource_group_name  = "hp-rgtest"
    location             = "Central India"
    virtual_network_name = "hp-vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }
}

pip = {
  subnet1 = {
    name                = "hp-pip"
    resource_group_name = "hp-rgtest"
    location            = "Central India"
    allocation_method   = "Static"

  }
}

nsg = {
  nsg1 = {
    name                = "hprulensg"
    location            = "centralindia"
    resource_group_name = "hp-rgtest"

    security_rules = [
      {
        security_rule_name         = "Allow-RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]


  }
}

nicnsg = {
  nicsng1 = {
    resource_group_name = "hp-rgtest"
    nic_name            = "hp-nic"
    nsg_name            = "hprulensg"
  }
}


nic = {
  nic1 = {
    name                          = "hp-nic"
    resource_group_name           = "hp-rgtest"
    location                      = "Central India"
    subnet_name                   = "hp-subnet"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "hp-pip"
    virtual_network_name = "hp-vnet"

  }
}

vm = {

  vm1 = {
    name                = "hp-vm"
    resource_group_name = "hp-rgtest"
    location            = "central india"
    size                = "Standard_B1s"
    nic_name            = "hp-nic"
    keyvault_name       = "kv5678"
    admin_username      = "vm-admin-username"
    admin_password      = "vm-admin-password"
    rg_keyvault_name = "hp-rg"


  }
}



