resource "azurerm_linux_virtual_machine_scale_set" "mediawiki_scale_set_blue" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_DS1_v2"
  instances           = 2

  network_profile {
    name      = "internal"
    subnet_id = var.subnet_id
  }

  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.4"
    version   = "latest"
  }
}
