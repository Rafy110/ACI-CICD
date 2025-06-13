provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "aci-rg"
  location = "East US 2"
}

resource "azurerm_container_group" "aci" {
  name                = "my-container"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = "mywebapp"
    image  = "rafikhan110/my-web-app:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "aci-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
