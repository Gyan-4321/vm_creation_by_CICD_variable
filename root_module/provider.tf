terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "hp-rg"
    storage_account_name = "mystorage56798"
    container_name = "storage378"
    key           = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "2c2a83bb-a243-4d9e-a20d-ad64406de5ba"

  features {

  }
}