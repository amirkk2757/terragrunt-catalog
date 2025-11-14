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
  source = "git::https://github.com/amirkk2757/terragrunt-catalog.git//modules/terraform-aws-ec2-instance?ref=main"
}

inputs = {
  # Required inputs
  name          = join("-", [values.identifier, local.tenant_name, local.tenant_site])
  instance_type = values.instance_type
  key_name      = values.key_name
  monitoring    = values.monitoring
  subnet_id     = values.subnet_id
  tags = {
    Terraform   = "true"
  }

}

