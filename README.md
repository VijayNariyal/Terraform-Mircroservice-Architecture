Terraform Microservice Architecture (Azure AKS + ACR)

This repository contains a modular Terraform setup for deploying cloud infrastructure required for microservices on Azure Kubernetes Service (AKS) using Azure Container Registry (ACR), Virtual Networks, Network Security Groups, and Resource Groups. The structure follows environment-based deployments (Dev, Prod) and reusable Terraform modules.

Project Structure:

Terraform-Microservice-Architecture/
├── Environments/
│   ├── Dev/
│   │   ├── .terraform/
│   │   ├── .terraform.lock.hcl
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfstate
│   │   ├── terraform.tfstate.backup
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   └── Prod/  # Production environment (to be created)
├── Modules/
│   ├── ACR/
│   │   ├── acr.tf
│   │   └── variable.tf
│   ├── AKS/
│   │   ├── aks.tf
│   │   └── variable.tf
│   ├── NSG/
│   │   ├── data.tf
│   │   ├── nsg.tf
│   │   └── variable.tf
│   ├── RG/
│   │   ├── main.tf
│   │   └── variable.tf
│   └── VNET/
│       ├── vnet.tf
│       └── variable.tf
└── README.md

Infrastructure Overview:

Resource Group (RG): Defines cloud boundary per environment.
Virtual Network (VNET): Custom VNET with subnets for AKS, ACR, and other components.
Network Security Group (NSG): Controls inbound/outbound traffic.
Azure Container Registry (ACR): Stores container images for microservices, integrated with AKS via AcrPull role.
Azure Kubernetes Service (AKS): Hosts microservices, uses SystemAssigned Managed Identity with ACR access.

Deployment Steps:

1. Initialize Terraform:
terraform init

2. Validate Configuration:
terraform validate

3. Generate Execution Plan:
terraform plan

4. Apply Changes:
terraform apply -auto-approve

Connect to AKS Cluster:

az aks get-credentials -n <aks-name> -g <resource-group>
kubectl get nodes

Recommended .gitignore:

.terraform/
*.tfstate
*.tfstate.backup
.terraform.lock.hcl
crash.log

Future Enhancements:

- Add Production environment
- Add GitHub Actions CI/CD pipeline
- Add Helm chart templates for microservices
- Add Ingress setup per service
- Add Monitoring stack (Prometheus/Grafana)