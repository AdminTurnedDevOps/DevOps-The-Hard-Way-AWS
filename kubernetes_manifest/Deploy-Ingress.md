Ah, since your EKS cluster is running in private subnets, accessing the service directly from the internet will require a bit more configuration. Here are some ways to achieve that:

### 1. Use an Ingress Controller:
An Ingress Controller can expose your services to the internet and handle routing, SSL termination, and more.

**Step-by-Step:**
1. **Deploy an Ingress Controller** (e.g., NGINX Ingress Controller):
    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
    ```

2. **Create an Ingress Resource**:
    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: uber-ui-ingress
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
    spec:
      rules:
      - host: <your-domain>
        http:
          paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: uber-ui
                port:
                  number: 6000
    ```

3. **Update DNS**:
    Point your domain `<your-domain>` to the external IP address of the Ingress Controller.

Great! Now that you've created the Ingress, let's verify and configure a few things to ensure it's working correctly and accessible from the internet.

### Step-by-Step Guide:

1. **Verify Ingress Resource**:
   Check the status of the Ingress resource to ensure it has been created and configured correctly:
   ```bash
   kubectl get ingress uber-ui-ingress
   ```
   You should see an output similar to:
   ```plaintext
   NAME             HOSTS           ADDRESS          PORTS     AGE
   uber-ui-ingress  <your-domain>   <external-ip>    80, 443   2m
   ```

2. **DNS Configuration**:
   If you haven't done so already, update your DNS settings to point your domain (`<your-domain>`) to the external IP address of the Ingress Controller.

3. **Access Your Application**:
   Once the DNS records have propagated (this can take a few minutes), you should be able to access your application using your domain:
   ```
   http://<your-domain>
   ```
   Make sure you use `https://` if your Ingress is configured to handle SSL/TLS termination.

4. **Check Logs for Issues**:
   If you encounter any issues, check the logs of the Ingress Controller for more information:
   ```bash
   kubectl logs -n ingress-nginx <ingress-controller-pod-name>
   ```

### Example Ingress Resource:
Here's a reminder of what your Ingress resource might look like:
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: uber-ui-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: <your-domain>
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: uber-ui
            port:
              number: 6000
```

### Security Considerations:
- **SSL/TLS**: For a production environment, you should configure SSL/TLS for secure communication. You can use Let's Encrypt for free SSL certificates and automate the renewal process using Cert-Manager.
- **Authentication and Authorization**: Depending on your use case, you might want to add authentication and authorization layers to protect your application.

### Monitoring and Maintenance:
- Regularly monitor the health of your Ingress Controller and application using monitoring tools like Prometheus, Grafana, or AWS CloudWatch.
- Keep your Kubernetes and application configurations up-to-date to ensure security and performance.

Let me know if you need help with any specific part of this process or if you encounter any issues!