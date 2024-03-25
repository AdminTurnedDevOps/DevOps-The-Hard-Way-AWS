RESOURCE_GROUP='devopsthehardway-rg'
ALB_RESOURCE_NAME='devopsthehardway-alb'
ALB_FRONTEND_NAME='alb-frontend'

RESOURCE_ID=$(az network alb show --resource-group $RESOURCE_GROUP --name $ALB_RESOURCE_NAME --query id -o tsv)

# Create a Gateway
kubectl apply -f - <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: gateway-01
  namespace: alb-devopsthehardway
  annotations:
    alb.networking.azure.io/alb-id: $RESOURCE_ID
spec:
  gatewayClassName: azure-alb-external
  listeners:
  - name: http
    port: 80
    protocol: HTTP
    allowedRoutes:
      namespaces:
        from: Same
  addresses:
  - type: alb.networking.azure.io/alb-frontend
    value: $ALB_FRONTEND_NAME
EOF

#Create HTTP Route
kubectl apply -f - <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: traffic-uberui
  namespace: uber-ui
spec:
  parentRefs:
  - name: gateway-01
  rules:
  - backendRefs:
    - name: uber-ui
      port: 5000
EOF
