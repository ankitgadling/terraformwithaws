## Day 3 - Create an AWS S3 Bucket Using Terraform

## What is an S3 bucket?
An Amazon S3 bucket is a scalable object storage container used to store files (objects) such as backups, logs, images, and static website assets. Each bucket has a globally unique name and can be configured with lifecycle policies, access controls, encryption, and versioning.

## When to use
- Durable object storage for static content, backups, and artifacts.
- Hosting static websites.
- Centralized storage for application logs or data.
- Remote Terraform state backends (when combined with locking).

## Prerequisites
- AWS account and appropriate IAM credentials.
- AWS CLI configured (or environment variables AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY).
- Terraform installed.


## Tips & best practices
- Bucket names must be globally unique - include a random suffix or org/project prefix.
- Enable encryption (SSE) and versioning for important data.
- Block public access unless intentionally hosting public assets.

## How to Create a VPC, S3 Bucket, and Implicit Dependency Using Terraform

### **Step 1: Install Terraform**

Download and install Terraform from the official website:
[https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

---

### **Step 2: Configure AWS Credentials**

Install and configure AWS CLI:

```bash
aws configure
```

Provide your:

* AWS Access Key
* AWS Secret Key
* AWS Region
* Output format
---

### **Step 3: Create `main.tf` File**

Create a folder and inside it create a file named **main.tf** with the following content:

```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${aws_vpc.main.id}"

  tags = {
    Name = "example-bucket"
    VPC  = aws_vpc.main.id
  }
}
```
---

### **Step 4: Initialize Terraform and  Validate the Terraform Configuration**

Run:
```bash
terraform init
```
This downloads the AWS provider and prepares the working directory.


Run:

```bash
terraform validate
```

This checks for syntax or configuration errors.

---

### **Step 5: Plan the Terraform Changes**

Run:

```bash
terraform plan
```

This shows what resources Terraform will create.

---

### **Step 6: Apply the Changes**

Run:

```bash
terraform apply
```

Type **yes** when prompted.

---

### **Step 7: Destroy the Resources**

When you are done, run:

```bash
terraform destroy
```

Type **yes** to confirm.

---




