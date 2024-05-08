variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure region where the resources will be provisioned"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "blue_subnet_name" {
  description = "The name of the blue subnet"
}

variable "blue_subnet_address_prefixes" {
  description = "The address prefixes for the blue subnet"
  type        = list(string)
}

variable "green_subnet_name" {
  description = "The name of the green subnet"
}

variable "green_subnet_address_prefixes" {
  description = "The address prefixes for the green subnet"
  type        = list(string)
}
