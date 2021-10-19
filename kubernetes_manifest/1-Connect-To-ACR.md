# Connecting To Elastic Kubernetes Service (AKS)

When you're deploying locally, without any CI/CD to AKS, you'll need to authenticate from your local terminal.

Once you authenticate to AKS from your local terminal, a `kubeconfig` gets stored on your computer. The `kubeconfig` has all of the connection information and authentication needs to connect to AKS.

## Connecting To AKS

1. Run the following command to connect to AKS:
`az aks get-credentials --resource-group devopsthehardway-rg --name devopsthehardwayaks`

2. Once connected, you should be able to run commands like the following to confirm you're connected:
`kubectl get nodes`