# Deploy The Uber App

Once the EKS cluster is built and the Kubernetes manifest is ready, you're now ready to deploy the Kubernetes manifest.

1. `cd` into the `kubernetes_manifest` directory
2. Run the following command:
`kubectl create -f deployment.yml`

You'll see an output that specifies the service and deployment was created.

3. Run the following command to confirm that the deployment was successful:
`kubectl get deployments`

