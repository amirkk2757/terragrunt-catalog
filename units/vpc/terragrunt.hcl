include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  # Automatically load account-level variables
  tenant_config = read_terragrunt_config(find_in_parent_folders("tenant.hcl"))
  tenant_name   = local.tenant_config.locals.tenant_name
  tenant_site   = local.tenant_config.locals.tenant_site
}

terraform {
  // NOTE: Take note that this source here uses
  // a Git URL instead of a local path.
  //
  // This is because units and stacks are generated
  // as shallow directories when consumed.
  //
  // Assume that a user consuming this unit will exclusively have access
  // to the directory this file is in, and nothing else in this repository.
  source = "git::https://github.com/amirkk2757/terragrunt-catalog.git//modules/terraform-aws-vpc?ref=main"
}

inputs = {
  # Required inputs
  name               = join("-", [ local.tenant_name, local.tenant_site])
  cidr               = "10.0.0.0/16"
  azs                = values.azs
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  tags = {
    Terraform = "true"
  }

}