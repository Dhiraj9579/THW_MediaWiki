
resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "rln"
    ttl           = 30
  }
}
