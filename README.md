# Terraform Microservice Architecture (Azure AKS + ACR)

NOTE: Change the SUBSCRIPTION ID in provider.tf for your subscription id

This repository contains a modular Terraform configuration for deploying cloud infrastructure required to run microservices on Azure Kubernetes Service (AKS). The solution includes Azure Container Registry (ACR), Virtual Networks (VNET), Network Security Groups (NSG), and Resource Groups (RG). The setup follows an environment-based approach (Dev, Prod) and uses fully reusable Terraform modules.

---

## Project Structure

```
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
│   └── Prod/                      # Production environment (to be added)
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
```

---

## Infrastructure Overview

### **Resource Group (RG)**
Defines cloud boundaries for each environment.

### **Virtual Network (VNET)**
Provides a custom network with dedicated subnets for AKS, ACR, and additional services.

### **Network Security Group (NSG)**
Controls inbound and outbound traffic to secure the environment.

### **Azure Container Registry (ACR)**
Stores Docker images for microservices. AKS accesses ACR via the **AcrPull** role.

### **Azure Kubernetes Service (AKS)**
Primary container orchestration platform for microservices.  
Uses **SystemAssigned Managed Identity** integrated with ACR.

---

## Deployment Steps

### **1. Initialize Terraform**
```sh
terraform init
```

### **2. Validate Configuration**
```sh
terraform validate
```

### **3. Generate Execution Plan**
```sh
terraform plan
```

### **4. Apply Infrastructure**
```sh
terraform apply -auto-approve
```

---

## Connect to the AKS Cluster

```sh
az aks get-credentials -n <aks-name> -g <resource-group>
kubectl get nodes
```

---

## Recommended `.gitignore`

```
.terraform/
*.tfstate
*.tfstate.backup
.terraform.lock.hcl
crash.log
```

---

## Future Enhancements

- Add Production environment  
- Implement GitHub Actions CI/CD pipeline  
- Add Helm chart templates for microservices  
- Configure per-service Ingress (NGINX/AGIC)  
- Add monitoring stack (Prometheus + Grafana)

---
