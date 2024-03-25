#!/bin/bash

RESOURCE_GROUP="devopsthehardway-rg"
AKS_NAME="devopsthehardwayaks"
helm_resource_namespace="azure-alb-system"
VNET_NAME="devopsthehardway-vnet"
ALB_SUBNET_NAME="appgw"
ALB_CONTROLLER_VERSION="1.0.0"

#create namespace
kubectl create namespace $helm_resource_namespace

# az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_NAME
helm install alb-controller oci://mcr.microsoft.com/application-lb/charts/alb-controller --namespace $helm_resource_namespace --version $ALB_CONTROLLER_VERSION --set albController.namespace=$helm_resource_namespace --set albController.podIdentity.clientID=$(az identity show -g $RESOURCE_GROUP -n azure-alb-identity --query clientId -o tsv)
