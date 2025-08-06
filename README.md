# EKS with Terraform – DevOps Engineer Assignment

## Overview
This project provisions a secure, production-ready Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. The setup includes:
- VPC with public and private subnets
- NAT Gateway for private subnet internet access
- EKS cluster and managed node group
- Proper IAM roles and policies

## Prerequisites
- AWS account with sufficient permissions
- AWS CLI configured (`aws configure`)
- Terraform v1.5.0 or newer
- kubectl installed

## Files
- `main.tf` (not present, logic split across below files)
- `provider.tf` – AWS provider configuration
- `variables.tf` – Input variables
- `vpc.tf` – VPC, subnets, NAT, route tables
- `iam.tf` – IAM roles and policies for EKS and nodes
- `eks.tf` – EKS cluster and node group
- `output.tf` – Useful Terraform outputs
- `terraform.tf` – Terraform backend and provider requirements
- `get-nodes.sh` – Helper script to get EKS nodes (see below)

## Architecture Diagram
```
[Internet]
    |
[Internet Gateway]
    |
[Public Subnet]---[NAT Gateway]---[Private Route Table]---[Private Subnets]
    |                                             |
[Public Route Table]                              |
    |                                             |
[EKS Cluster Control Plane] <---------------------+
    |
[EKS Node Group (in Private Subnets)]
```

## Setup Instructions

1. **Clone the repository**
   ```sh
   git clone <your-repo-url>
   cd <repo-directory>
   ```

2. **Initialize Terraform**
   ```sh
   terraform init
   ```

3. **Review and (optionally) edit variables**
   - See `variables.tf` for region, VPC CIDRs, etc.

4. **Apply Terraform**
   ```sh
   terraform apply
   ```
   - Type `yes` when prompted.

5. **Configure kubectl**
   - Use the output command:
     ```sh
     aws eks update-kubeconfig --region <region> --name <cluster_name> --profile <aws_profile>
     ```
   - Or copy the `kubeconfig_command` output from Terraform.

6. **Verify EKS Node Group**
   - Run the helper script or use kubectl directly:
     ```sh
     ./get-nodes.sh
     # or
     kubectl get nodes
     ```

## get-nodes.sh
```sh
#!/bin/bash
kubectl get nodes
```

## Clean Up
To destroy all resources:
```sh
terraform destroy
```

## Notes
- All worker nodes are in private subnets for security.
- NAT Gateway enables internet access for nodes (for updates, pulling images, etc).
- IAM roles are least-privilege for EKS and node group.

## Submission Instructions
1. Create a new public GitHub repository (do not fork or clone any existing repos).
2. Open the repository in GitHub Codespaces and complete all your work there.
3. Push all relevant code (Terraform files, get-nodes.sh, README.md) to the repo.
4. Once complete, share the link to your GitHub repository with us for review.

---

Feel free to reach out if you have any questions or need further clarifications!
