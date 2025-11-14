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
  source = "git::https://github.com/amirkk2757/terragrunt-catalog.git//modules/terraform-aws-ec2-instance?ref=main"
}

inputs = {
  # Required inputs
  name          = value.name
  instance_type = value.instance_type
  key_name      = value.key_name
  monitoring    = value.monitoring
  subnet_id     = value.subnet_id
  tags = {
    Terraform   = "true"
  }

}

