resource "azurerm_public_ip" "example" {
  name                = "appgateway-pip"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "aks-beap"
  frontend_port_name             = "aks-feport"
  frontend_ip_configuration_name = "aks-feip"
  http_setting_name              = "aks-be-htst"
  listener_name                  = "aks-httplstn"
  request_routing_rule_name      = "aks-rqrt"
  redirect_configuration_name    = "aks-rdrcfg"
}

resource "azurerm_application_gateway" "aks" {
  name                = "aks-appgateway"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.appgwsubnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

    tags = var.tags

}