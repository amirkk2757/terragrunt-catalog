include "root" {
  path = find_in_parent_folders("root.hcl")
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
  source = "git::https://github.com/amirkk2757/terragrunt-catalog.git//modules/vpc-eks?ref=${values.version}"
}

inputs = {
  # Required inputs
  vpc_cidr           = values.vpc_cidr
  kubernetes_version = values.kubernetes_version
  tenant_name        = values.tenant_name
  environment_name   = values.environment_name

}
