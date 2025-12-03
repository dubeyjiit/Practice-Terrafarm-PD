# Terraform Starter Repo — AWS (Example)

**Purpose:** Example Terraform project with modules, environment folders (dev/stage/prod), remote backend hints, and GitHub Actions for CI.

## What's included
- `modules/vpc/` — reusable VPC module
- `modules/ec2/` — reusable EC2 module
- `envs/dev/` — root config for dev environment (uses modules)
- `envs/stage/` — (copy of dev, ready to tweak)
- `envs/prod/` — (empty scaffold)
- `.github/workflows/terraform.yml` — GitHub Actions: runs fmt/validate/plan on PR

## Quick start (local)
1. Install Terraform (see https://developer.hashicorp.com/terraform/install)
2. Configure AWS credentials (recommended):

   ```bash
   aws configure
   # or export env vars:
   export AWS_ACCESS_KEY_ID=...
   export AWS_SECRET_ACCESS_KEY=...
   export AWS_REGION=ap-south-1
   ```
3. Change to the dev env and initialise:

   ```bash
   cd envs/dev
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan
   ```
4. Cleanup when done:

   ```bash
   terraform destroy
   ```

## Notes / safe defaults
- AMI id in examples is a placeholder. Replace with a valid AMI for your region.
- Remote backend (S3 + DynamoDB) is shown as a commented block in `envs/dev/backend.tf`.
- Use `-var-file=secrets.tfvars` to pass secrets (and add that file to .gitignore).

## Learning path (what to do next)
- Day 1: Run the dev example, understand `init/plan/apply`
- Day 2: Parameterize variables and outputs
- Day 3: Build and test modules
- Day 4: Setup S3 backend + DynamoDB locking
- Day 5: Add GitHub Actions to run plan on PR
- Day 6: Create prod workspace with stricter IAM and review

Good luck — practice daily and ask me if you get stuck! 🚀