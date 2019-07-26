# Prometheus AWS Cost Explorer Demo

### Install Prerequisites

```
brew install terraform
```

### Initialise Terraform State Backend

```
cd terraform-state-backend
terraform init
terraform apply --auto-approve
```

### Create Demo Prometheus Environment

```
cd terraform
terraform init
terraform apply --auto-approve
```
