# Azure Application Load Balancer for Containers
resource "azurerm_application_load_balancer" "alb" {
  name                = "devopsthehardway-alb"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  tags = var.tags
}

resource "azurerm_application_load_balancer_subnet_association" "alb" {
  name                         = "alb-subnet-association"
  application_load_balancer_id = azurerm_application_load_balancer.alb.id
  subnet_id                    = azurerm_subnet.app_gwsubnet.id
}

resource "azurerm_application_load_balancer_frontend" "example" {
  name                         = "alb-frontend"
  application_load_balancer_id = azurerm_application_load_balancer.alb.id
}