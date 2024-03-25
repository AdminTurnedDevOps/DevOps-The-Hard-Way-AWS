data "azurerm_resource_group" "node_resource_group" {
  name = azurerm_kubernetes_cluster.k8s.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

resource "azurerm_role_assignment" "node_infrastructure_update_scale_set" {
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  scope                = data.azurerm_resource_group.node_resource_group.id
  role_definition_name = "Virtual Machine Contributor"
  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

data "azurerm_container_registry" "acr" {
  name                = "${var.name}tamopsacr"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "acrpull"
  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

#fixing for  "The client '62119122-6287-4620-98b4-bf86535e2ece' with object id '62119122-6287-4620-98b4-bf86535e2ece' does not have authorization to perform action 'Microsoft.ServiceNetworking/register/action' over scope '/subscriptions/XXXXX' or the scope is invalid. (As part of App Gw for containers - maanged by ALB controller setup)"

# Delegate AppGw for Containers Configuration Manager role to RG containing Application Gateway for Containers resource
# az role assignment create --assignee-object-id $principalId --assignee-principal-type ServicePrincipal --scope $resourceGroupId --role "fbc52c3f-28ad-4303-a892-8a056630b8f1" 
resource "azurerm_role_assignment" "appgwcontainerfix2" {
  principal_id         = azurerm_user_assigned_identity.alb_identity.principal_id
  scope                = data.azurerm_resource_group.resource_group.id
  role_definition_name = "AppGw for Containers Configuration Manager"
  depends_on = [
    azurerm_kubernetes_cluster.k8s,
    azurerm_user_assigned_identity.alb_identity
  ]
}

# Delegate Network Contributor permission for join to association subnet
# az role assignment create --assignee-object-id $principalId --assignee-principal-type ServicePrincipal --scope $ALB_SUBNET_ID --role "4d97b98b-1d4f-4787-a291-c67834d212e7" 
resource "azurerm_role_assignment" "appgwcontainerfix3" {
  principal_id         = azurerm_user_assigned_identity.alb_identity.principal_id
  scope                = data.azurerm_subnet.appgwsubnet.id
  role_definition_name = "Network Contributor"
  depends_on = [
    azurerm_kubernetes_cluster.k8s,
    azurerm_user_assigned_identity.alb_identity
  ]
}