# Azure Data Factory Pipeline Deployment with Terraform and GitLab

This example demonstrates how to deploy Azure Data Factory (ADF) pipelines to
existing ADF instances across Test, UAT and Prod environments. Terraform
references the existing factories and applies pipeline definitions stored in
this repository. A GitLab CI pipeline orchestrates validation, planning and
applying of the Terraform configuration for each environment.

## Structure

- **terraform/** – Terraform configuration and variable files
  - `versions.tf` – Terraform and provider requirements
  - `main.tf` – Deploys a pipeline to an existing Data Factory
  - `pipeline.json` – Sample ADF pipeline definition
  - `test.tfvars`, `uat.tfvars`, `prod.tfvars` – Environment specific values
- `.gitlab-ci.yml` – Pipeline definition running Terraform for each environment

## Usage

1. Configure GitLab CI variables for Azure authentication (e.g.
   `ARM_SUBSCRIPTION_ID`, `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`,
   `ARM_TENANT_ID`).
2. Update `pipeline.json` with your pipeline exported from the Dev Data
   Factory.
3. Commit changes and push to trigger the pipeline.
4. Review and manually apply each environment when ready.

This provides a simple foundation for promoting ADF pipelines through
multiple environments using Terraform and GitLab.
