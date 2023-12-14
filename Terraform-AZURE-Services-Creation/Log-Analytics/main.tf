terraform {
  required_version = ">= 1.5.7"
  backend "azurerm" {
    resource_group_name  = "devopshardway-rg"
    storage_account_name = "devopshardwaysa"
    container_name       = "tfstate"
    key                  = "la-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "resource_group" {
  name = "${var.name}-rg"
}

resource "azurerm_log_analytics_workspace" "Log_Analytics_WorkSpace" {
  # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
  name                = "${var.name}-la"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"

    tags = var.tags

}

resource "azurerm_log_analytics_solution" "Log_Analytics_Solution_ContainerInsights" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.location
  resource_group_name   = data.azurerm_resource_group.resource_group.name
  workspace_resource_id = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.id
  workspace_name        = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}