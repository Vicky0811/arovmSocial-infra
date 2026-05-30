# arovmSocial Infrastructure

Terraform infrastructure for arovmSocial — VPC, EC2, RDS MySQL, S3, SSM, IAM.

## Architecture

```
aws_infra/
├── bootstrap/              # One-time setup: S3 state bucket + DynamoDB lock table
├── modules/
│   ├── networking/         # VPC, subnets, IGW, route tables
│   ├── compute/            # EC2, keypair, IAM role, security group
│   ├── database/           # RDS MySQL, SSM parameters, RDS security group
│   └── storage/            # S3 media bucket
└── environments/
    ├── dev/                # t2.micro, db.t3.micro
    ├── staging/            # t3.small, db.t3.small
    └── prod/               # t3.medium, db.t3.medium
```

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured with profile `arovm`
- Bootstrap must be run once before any environment

## Bootstrap (run once)

```bash
cd bootstrap
terraform init
terraform apply
```

## Deploy an environment

```bash
cd environments/dev

# Set DB password as environment variable
# Windows:
$env:TF_VAR_db_password = "yourpassword"
# Linux/Mac:
export TF_VAR_db_password="yourpassword"

terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

## Destroy an environment

```bash
cd environments/dev
terraform destroy
```

## Environment differences

| Setting          | dev        | staging     | prod        |
|------------------|------------|-------------|-------------|
| EC2 instance     | t2.micro   | t3.small    | t3.medium   |
| RDS instance     | db.t3.micro| db.t3.small | db.t3.medium|
| Volume size      | 20 GB      | 30 GB       | 50 GB       |
| VPC CIDR         | 10.0.0.0/16| 10.1.0.0/16 | 10.2.0.0/16 |

## State

State is stored remotely in S3 with DynamoDB locking:

- Bucket: `myapp-terraform-state-arovm`
- Dev state: `myapp/dev/terraform.tfstate`
- Staging state: `myapp/staging/terraform.tfstate`
- Prod state: `myapp/prod/terraform.tfstate`
- Lock table: `myapp-terraform-locks`

## Security notes

- Never commit `terraform.tfvars` — it is gitignored
- Never commit `*.pem` key files — they are gitignored
- DB password is passed via `TF_VAR_db_password` environment variable only
- RDS is in private subnet — not accessible from internet
- S3 media bucket has all public access blocked
- EC2 reads secrets from SSM Parameter Store via IAM role
