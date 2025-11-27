data "azurerm_network_interface" "testing-nic" {
  for_each = var.nicnsg
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name

}

data "azurerm_network_security_group" "testing-nsg" {
  for_each = var.nicnsg
  name = each.value.nsg_name
  resource_group_name = each.value.resource_group_name

}




resource "azurerm_network_interface_security_group_association" "testing-nsgnic" {
    for_each = var.nicnsg
    network_interface_id = data.azurerm_network_interface.testing-nic[each.key].id
    network_security_group_id = data.azurerm_network_security_group.testing-nsg[each.key].id
}
