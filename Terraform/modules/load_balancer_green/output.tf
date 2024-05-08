output "lb_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.lb_green.name
}

output "lb_public_ip_green" {
  description = "The public IP address of the load balancer"
  value       = azurerm_public_ip.lb_public_ip_green.ip_address
}
