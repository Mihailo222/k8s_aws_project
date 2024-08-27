![Screenshot (1736)](https://github.com/user-attachments/assets/bbb57687-14ab-42a0-abc5-3b7afd4f766a)

<h1>Project Overview</h1>
This project involves using Kubernetes (K8s) resources to implement and connect them to the official Nextcloud Helm chart, which can be found here.

<h2>Introduction to Helm and Project Objectives</h2>
I was introduced to Helm, a package manager for Kubernetes, and became familiar with its somewhat complex structure. This project is focused on experimenting with the parameters provided in the Nextcloud Helm chart. The primary objectives are:  

* <b>Use S3 Bucket:</b> Store user files in an S3 bucket.  
* <b>Use AWS RDS:</b> Store user credentials in an AWS RDS instance.  
* <b>Use AWS Secrets Manager:</b> Store environment variables such as MYSQL_DATABASE, MYSQL_HOST, MYSQL_PASSWORD, and MYSQL_USER as key-value pairs. Storing these secrets in this manner is crucial for keeping them secure, especially when code is placed under version control, e.g., GitHub.  
* <b>Use Redis:</b> Implement Redis master and replica containers for improved application performance and caching.  
* <b>Use Ingress with Custom Domain:</b> Configure Ingress with a custom domain.  
Integration with AWS Resources
Connecting the EKS cluster with AWS resources and ensuring proper permissions was an intriguing experience. It was satisfying to see these resources work seamlessly with my pods in the cluster.

<h2>Deployment Steps</h2>
<b>Authentication: </b> To deploy the YAML files to the EKS cluster, authentication with AWS is required. I used the command: aws sso login --profile profile_name, as I had already authenticated via my browser with multi-factor authentication.

<b>Kubeconfig Update:</b> To communicate with the cluster, update the ~/.kube/config file with the cluster configuration using the command: aws eks update-kubeconfig --region reg-name --name cluster-name --profile profile_name.

<h2>Helm Chart Overview</h2>
My Helm chart is based on one of Helm's official charts. The values.yaml file can be fully customized. When deploying with the command helm install mihailo-rel-nextcloud ./, a Nextcloud application pod is created along with the Nextcloud deployment. This is exposed to the cluster as a Nextcloud service with type ClusterIP. To upgrade the resources, you can modify the values.yaml and run: helm upgrade mihailo-rel-nextcloud . (assuming the Helm project is in the present working directory).

<h2>Ingress Configuration</h2>
To expose our service to the internet, we need to configure an Ingress resource.

Install Ingress Controller: I chose the <b>NGINX Ingress Controller</b> and installed it via a Helm chart. The following services and pods are installed in the ingress-nginx namespace:  
* Pod named ingress-nginx-controller (the controller)
* Service named ingress-nginx-controller with type LoadBalancer, which provides a public IP address.
* Service ingress-nginx-controller-admission, which exposes the controller to the cluster via a ClusterIP.  
  
<b>Connect NGINX Controller:</b> After confirming that the deployment and Nextcloud application are exposed through the service, I connected the NGINX controller to the service using a YAML file in the GitHub repository. This is done through rules based on client requests (e.g., requests with host: mydomain1.academy.cyberlab.rs are directed to a specific service on port 8080).

<h2>Configuring Route 53 for DNS</h2>
To use AWS Route 53 as an external DNS server for our EKS cluster:

* Grant Permissions: Configure the cluster with permissions to access Route 53. I had a public domain (e.g., domain.ca) and created an A record to point the public IP address of my load balancer to this domain in my hosted zone. I set up a wildcard record *.domain.ca to cover all subdomains.
* Configure Route 53 Access Policy: Using Terraform, I configured an AWS Route 53 Access Policy and attached it to a role. This policy includes permissions for route53:ListResourceRecordSets, route53:ListHostedZones, and route53:GetHostedZone. This role is used by the service account within the Nextcloud deployment.

<h2>S3 Bucket Access</h2>
For connecting to the S3 bucket, parameters in the values.yaml file can be configured. However, the recommended approach is to use a service account with an assigned role. The role for the S3 bucket is defined in the Terraform code.

<h2>Using Secrets for Database Connection</h2>
<b>External Secrets Operator (ESO):</b> I installed the External Secrets Operator (ESO) via a Helm chart. ESO synchronizes secrets from external APIs (e.g., AWS Secrets Manager) with Kubernetes secrets in the cluster. This ensures that secrets are not stored in version control but in an external resource.

<b>ESO Components:</b>

* <b>SecretStore:</b> Provides the ESO with information on how to connect to the secrets manager, including access keys and secret access keys.
* <b>External Secret:</b> Defines how to retrieve secrets from an external store. I created an External Secret object with a refresh interval and a reference to the SecretStore. The secret from AWS is periodically refreshed.
* <b>Integration:</b> These external variables are named in the values.yaml file and passed as environment variables in the deployment.

<h2>Configuring Persistent Volumes for Redis</h2>  

* Redis Configuration: Redis is configured with two pods (master and replica) and requires persistent volumes for caching. I set up two EBS volumes on AWS and configured Persistent Volume Claims (PVCs) in the deployment to use these EBS volumes. The storage class used is gp2. Also, attached ebs csi driver to the EKS cluster.
* Troubleshooting: Initially, the EBS volumes were not utilized despite being bound to PVCs. By inspecting the aws-auth config map and assigning the IAM role for the cluster the ec2fullaccess policy, the volumes began to work correctly. Now, Redis master and replica pods cache data effectively.
