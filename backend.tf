terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatestorage4855"
    container_name       = "tfstatefiles"
    key                  = "aci.terraform.tfstate"
  }
}
