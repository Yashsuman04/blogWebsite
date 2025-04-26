terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
  required_version = ">=1.0.0"
}

provider "azurerm" {
  subscription_id = "9a2083dd-e5f8-4f25-9b0b-23b06a485ddb"
  tenant_id       = "1320b4f6-35bd-4e24-8d0e-f08f366c4fd7"
  features {}
}


resource "azurerm_resource_group" "example" {
  name     = "examResourceGroup"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examstorageaccount01"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
