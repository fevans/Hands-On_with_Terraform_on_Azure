terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "EVF_Consulting"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
  subscription_id = "9734ed68-621d-47ed-babd-269110dbacb1"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-7b9647a3-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage" {
  source  = "app.terraform.io/EVF_Consulting/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "evf01secstore001tut"

}