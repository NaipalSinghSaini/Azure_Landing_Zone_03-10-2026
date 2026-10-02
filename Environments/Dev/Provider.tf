terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.7.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-strg"
    storage_account_name = "blobstr12345"
    container_name       = "dev-container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}