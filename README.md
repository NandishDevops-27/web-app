# web-app end-to-end deployemnet documentation

# web app deployment steps

## infrastructure setup
1. create EKS cluster with above terraform scripts
    # terraform init
    # terraform validate
    # terraform plan
    # terraform apply
2. Configure the kubectl
    aws eks --region ap-south-1 update-kubeconfig --name web-app-eks

# Build and Docker Image
    docker build -t web-app-image:latest
    docker push web-app-image:latest ( Use ECR or any other external artifactory)

## Kubernetes Deployment and Setting Prometheus & Grafana to monitor the k8s cluster.

1. create deployement, service, and prometheus manifest files
    
2. Apply the deployment files:
    # kubectl apply -f k8s/deployment.yaml
    # kubectl apply -f k8s/service.yaml
    # kubectl apply -f k8s/prometheus-deployment.yaml

esle

   for premothus we can also setup opened source/centralised repo
     # helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 
     # helm install prometheus prometheus-community/prometheus

    Setting up Grfana:
    # helm repo add grafana https://grafana.github.io/helm-charts
    # helm install grafana grafana/grafana

# Access the we app
    kubectl get svc
    or 
    kubectl get all
    kubectl get deploymnet
    kubectl logs -f <pod name> -c <contaner-name>
    open the IP address in brouwser

# Access the Premetheus dashboard
    kubectl get prometheus 
    <nodeip>:<nodeport> in browser
