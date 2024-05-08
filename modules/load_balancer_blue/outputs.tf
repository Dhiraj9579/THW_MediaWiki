output "lb_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.lb_blue.name
}

output "lb_public_ip_blue" {
  description = "The public IP address of the load balancer"
  value       = azurerm_public_ip.lb_public_ip_blue.ip_address
}
