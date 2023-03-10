terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "static-site-rg" {
  name     = "static-site-rg"
  location = "West Europe"
}

resource "azurerm_static_site" "static-site" {
  name                = "static-site"
  resource_group_name = azurerm_resource_group.static-site-rg.name
  location            = azurerm_resource_group.static-site-rg.location
}