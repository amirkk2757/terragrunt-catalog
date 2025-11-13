provider "aws" {
  region = "us-east-1"
  alias  = "cicd-hub"

  assume_role {
    role_arn     = "arn:aws:iam::134319464995:role/TerraformDeploy"

  }
}