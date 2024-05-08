provider "azurerm" {
  features {}
}

module "networking" {
  source = "./modules/networking"

  resource_group_name           = "rg-resources"
  location                      = "East US"
  virtual_network_name          = "vnet1"
  virtual_network_address_space = ["10.0.0.0/16"]
  blue_subnet_name              = "blue-subnet"
  blue_subnet_address_prefixes  = ["10.0.1.0/24"]
  green_subnet_name             = "green-subnet"
  green_subnet_address_prefixes = ["10.0.2.0/24"]
}

module "load_balancer_blue" {
  source = "./modules/load_balancer"

  name                = "lb-blue"
  location            = module.networking.location
  resource_group_name = module.networking.resource_group_name
}

module "load_balancer_green" {
  source = "./modules/load_balancer"

  name                = "lb-green"
  location            = module.networking.location
  resource_group_name = module.networking.resource_group_name
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = "azure-traffic-manager-profile"
  resource_group_name = module.networking.resource_group_name
}

module "vmss_blue" {
  source = "./modules/virtual_machine_scale_set_blue"

  name                = "mediawiki-scale-set-blue"
  resource_group_name = module.networking.resource_group_name
  location            = module.networking.location
  subnet_id           = module.networking.blue_subnet_id
}

module "vmss_green" {
  source = "./modules/virtual_machine_scale_set_green"

  name                = "mediawiki-scale-set-green"
  resource_group_name = module.networking.resource_group_name
  location            = module.networking.location
  subnet_id           = module.networking.green_subnet_id
}

module "traffic_manager_endpoints" {
  source = "./modules/traffic_manager_endpoints"

  traffic_manager_profile_name = module.traffic_manager.traffic_manager_profile_name
  lb_blue_name                 = module.load_balancer_blue.lb_name
  lb_green_name                = module.load_balancer_green.lb_name
}
