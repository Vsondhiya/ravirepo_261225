terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
   resource_group_name  = "dev-rg"
   storage_account_name = "vinodstg123"
   container_name       = "vinodcontainer"
    key                  = "dev.terraform.tfstate"
   }
}

provider "azurerm" {
  features {}
  subscription_id = "f4364164-2e58-4621-8dd2-b48e519fd047"
}
