data "azurerm_key_vault" "keyvaulttest" {
    for_each = var.vm
    name = each.value.keyvault_name
  resource_group_name = each.value.rg_keyvault_name
}

data "azurerm_key_vault_secret" "test-username" {
    for_each = var.vm
    name = each.value.admin_username
  key_vault_id = data.azurerm_key_vault.keyvaulttest[each.key].id
  
  
}

data "azurerm_key_vault_secret" "test-password" {
    for_each = var.vm
    name = each.value.admin_password
  key_vault_id = data.azurerm_key_vault.keyvaulttest[each.key].id
  
}

data "azurerm_network_interface" "testing-nic" {
  for_each = var.vm
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name

}



resource "azurerm_linux_virtual_machine" "vmtest" {
  for_each = var.vm
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = each.value.size
  admin_username = data.azurerm_key_vault_secret.test-username[each.key].value
  admin_password = data.azurerm_key_vault_secret.test-password[each.key].value
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.testing-nic[each.key].id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
    }
}