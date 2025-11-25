## Day 2 - Terraform AWS Provider

## What is a provider?
A provider is a plugin that enables Terraform to manage resources from a specific cloud or service. It translates Terraform configuration (HCL) into API calls the provider understands. Providers are the bridge between Terraform and target platforms such as cloud providers, SaaS products, and other services.

Providers can be:
- Official (aws, gcp, azure, kubernetes)
- Partner
- Community

## Importance of versions
Versioning matters. Terraform itself and providers evolve continuously new features, bug fixes, and breaking changes are common. Specifying and pinning provider and Terraform versions ensures consistent behavior across environments and prevents unexpected breakages. Use the terraform block's required_providers and required_version settings and rely on the provider lock file (terraform.lock.hcl) to maintain reproducible runs.

## Overview of the Terraform AWS Provider
The Terraform AWS Provider allows Terraform to create, read, update, and delete AWS resources by converting HCL to AWS API requests. It covers a wide range of services (EC2, S3, VPC, IAM, RDS, Lambda, CloudWatch, and many more) and supports data sources, resource arguments, and lifecycle options.

Key points:
- Authentication: supports shared credentials (~/.aws/credentials), environment variables, profiles, STS assume role, EC2/ECS task roles, and SSO.
- Configuration: region, profile, access keys, assume_role, endpoints, and aliases for multiple providers/accounts/regions.
- Best practices: pin provider versions, use state locking/backends, split environments or accounts with workspaces or multiple providers, and test changes in non-production first.

Example (minimal):
```hcl
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
    required_version = ">= 1.0.0"
}

provider "aws" {
    region = "us-west-2"
}
```

## Resources
- https://youtu.be/JFiMmaktnuM?si=GUeS8ZiaGEizCrxh
- https://registry.terraform.io/providers/hashicorp/aws/latest
