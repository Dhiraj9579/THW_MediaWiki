resource "azurerm_traffic_manager_endpoint" "blue" {
  name                      = "blue-endpoint"
  resource_group_name       = var.resource_group_name
  traffic_manager_profile_id = var.traffic_manager_profile_name
  type                      = "azureEndpoints"
  target_resource_id        = var.lb_blue_name
  weight                    = 100
  endpoint_status           = "Enabled"
}

resource "azurerm_traffic_manager_endpoint" "green" {
  name                      = "green-endpoint"
  resource_group_name       = var.resource_group_name
  traffic_manager_profile_id = var.traffic_manager_profile_name
  type                      = "azureEndpoints"
  target_resource_id        = var.lb_green_name
  weight                    = 0
  endpoint_status           = "Enabled"
}
