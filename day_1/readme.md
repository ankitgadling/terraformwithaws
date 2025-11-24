## Day 1 - Introduction to Infrastructure as Code (IaC)

## Why IaC is needed
When tasks are done manually, especially large or repetitive ones, mistakes can occur or important steps can be missed. Infrastructure as Code (IaC) addresses these issues by expressing infrastructure and operational tasks as code, which saves time and reduces human error. And most important it saves money create resouces any time and destroy it once job done.

## Common IaC tools
- Terraform (HashiCorp)
- AWS CloudFormation
- Pulumi

## What is Terraform
- An open-source tool to define, preview, and apply infrastructure changes across providers.

## HashiCorp Configuration Language (HCL)
- A human-readable configuration language used by Terraform.
- JSON-like structure with its own syntax.

## How Terraform works (high level)
1. Write configuration files (.tf) describing desired resources.  
2. terraform init — initialize the working directory and providers.  
3. terraform plan — preview the changes Terraform will make.  
4. terraform apply — apply the changes and update state.  
5. terraform destroy — remove managed resources when needed.  
- Terraform uses providers to communicate with cloud APIs and performs dependency-aware create/update/delete operations.

## Resources
- https://developer.hashicorp.com/terraform
- https://youtu.be/s5fwSG_00P8?si=epKvVwufo3BRyQW0
