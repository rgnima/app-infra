terraform {

backend "azurerm" {
    key = "github.terraform.tfstate"
}

required_version = ">=0.13"

required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.2.0"
    }
  }
}

##
# Providers
##

provider "azurerm" {
  features {}
}
