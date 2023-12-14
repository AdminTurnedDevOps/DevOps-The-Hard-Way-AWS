data "azurerm_resource_group" "resource_group" {
  name = "${var.name}-rg"
}

data "azurerm_subnet" "akssubnet" {
  name                 = "aks"
  virtual_network_name = "${var.name}-vnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}

data "azurerm_subnet" "appgwsubnet" {
  name                 = "appgw"
  virtual_network_name = "${var.name}-vnet"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}

data "azurerm_log_analytics_workspace" "workspace" {
  name                = "${var.name}-la"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}