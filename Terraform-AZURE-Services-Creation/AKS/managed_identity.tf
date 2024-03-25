resource "azurerm_user_assigned_identity" "alb_identity" {
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  name                = "azure-alb-identity"
}

resource "azurerm_federated_identity_credential" "alb_federated_identity" {
  name                = "azure-alb-identity"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.k8s.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.alb_identity.id
  subject             = "system:serviceaccount:azure-alb-system:alb-controller-sa"

  depends_on = [
    azurerm_user_assigned_identity.alb_identity,
    azurerm_kubernetes_cluster.k8s

  ]
}