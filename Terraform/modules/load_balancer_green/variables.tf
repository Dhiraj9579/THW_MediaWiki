variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "location" {
  description = "The location/region where the load balancer will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the load balancer"
  type        = string
}