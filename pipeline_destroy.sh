#!/bin/bash

set -e

echo "DESTROY DO POST-DEPLOYMENT"

cd post-deployment\\environment

rm -rf .terraform
terraform init -backend-config=backend.tfvars
terraform destroy --auto-approve -var-file=terraform.tfvars

echo "DESTROY DO DEPLOYMENT SA-EAST-1"

cd ..\\..
cd deployment\\environment

rm -rf .terraform
terraform init -backend-config=sa-east-1\\backend.tfvars
terraform destroy --auto-approve -var-file=sa-east-1\\terraform.tfvars

echo "DESTROY DO DEPLOYMENT US-EAST-1"

cd ..
cd environment

rm -rf .terraform
terraform init -backend-config=us-east-1\\backend.tfvars
terraform destroy --auto-approve -var-file=us-east-1\\terraform.tfvars

echo "DESTROY DO PRE-DEPLOYMENT"

cd ..\\..
cd pre-deployment\\environment

rm -rf .terraform
terraform init -backend-config=backend.tfvars
terraform destroy --auto-approve -var-file=terraform.tfvars