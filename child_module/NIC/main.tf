data "azurerm_subnet" "testing-subnet" {
  for_each = var.nic
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}

data "azurerm_public_ip" "testing-pip" {
  for_each = var.nic
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  
}



resource "azurerm_network_interface" "testing-nic" {
   for_each = var.nic
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location

  ip_configuration {
    
    name = each.value.name
    subnet_id = data.azurerm_subnet.testing-subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.testing-pip[each.key].id
  }
}