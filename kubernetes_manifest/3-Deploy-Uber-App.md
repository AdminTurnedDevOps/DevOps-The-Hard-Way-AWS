# Deploy The Uber App

Once the AKS cluster is built and the Kubernetes manifest is ready, you're now ready to deploy the Kubernetes manifest.

1. `cd` into the `kubernetes_manifest` directory
2. Run the following command:
`kubectl create -f deployment.yml`

You'll see an output that specifies the service and deployment was created.

3. Run the following command to confirm that the deployment was successful:
`kubectl get deployments`

4. Access uber-ui via Application Gateway
`kubectl get ingress`

`NAME      CLASS    HOSTS   ADDRESS         PORTS   AGE
uber-ui   <none>   *       20.90.236.246   80      11s`

Access the uber-ui using the address mentioned above, `http://20.90.236.246`