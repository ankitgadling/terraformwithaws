## Day 5 - Terraform Variables

## Why Do We Need Variables?

Variables in Terraform allow you to:

* Avoid hardcoding values (region, env, instance type, tags)
* Reuse configurations across multiple environments (dev, stage, prod)
* Improve readability and modularity
* Pass values between modules using inputs & outputs

---

## Types of Terraform Variables

### 1. Input Variables

Used to pass values into Terraform from users or external sources.

**Example:**

```hcl
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}
```

---

### 2. Output Variables

Used to display or export values after `terraform apply`.

**Example:**

```hcl
output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
```

---

### 3. Local Values (locals)

Used to simplify complex or repeated expressions.

**Example:**

```hcl
locals {
  env_name = "dev"
}
```

---

## String Concatenation in Terraform

```hcl
"${var.env}-bucket"

"${var.env}-bucket-${var.region}"
```
---

## Terraform Variable Precedence

Terraform loads variables in the following order (LOW to HIGH precedence):

| Precedence | Source                                 | Notes                             |
| ---------- | -------------------------------------- | --------------------------------- |
| 1          | **Default values in variables.tf**     | lowest priority                   |
| 2          | **Environment variables**              | export TF_VAR_region="us-east-1"  |
| 3          | **terraform.tfvars**                   | auto-loaded                       |
| 4          | **terraform.tfvars.json**              | auto-loaded                       |
| 5          | ***.auto.tfvars / *.auto.tfvars.json** | auto-loaded in alphabetical order |
| 6          | **-var and -var-file CLI flags**       | highest priority                  |

---

### Example Environment Variable

```bash
export TF_VAR_env="dev"
```

---

### ✔ Example CLI Variable

```bash
terraform apply -var="env=dev"
```

### ✔ Example CLI Var File

```bash
terraform apply -var-file="dev.tfvars"
```

---

## Example: Creating an S3 Bucket Using env = dev

---

## **variables.tf**

```hcl
variable "env" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}
```

---

## **main.tf**

```hcl
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "demo" {
  bucket = "${var.env}-bucket-demo"
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
```

---

## **terraform.tfvars (optional)**

```hcl
env = "dev"
```

---

## **Run Commands**

```bash
terraform init
terraform plan
terraform apply
```

---

### **Resulting Bucket Name**

```
dev-bucket-demo
```

---
