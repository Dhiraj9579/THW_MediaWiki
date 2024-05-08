output "location" {
  value = azurerm_resource_group.rg.location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "blue_subnet_id" {
  value = azurerm_subnet.blue.id
}

output "green_subnet_id" {
  value = azurerm_subnet.green.id
}
