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
  source = "git::https://github.com/amirkk2757/terragrunt-catalog.git//modules/terraform-aws-rds/modules/db_instance?ref=main"
}

inputs = {
  identifier                           = values.identifier
  engine                               = "mysql"
  engine_version                       = "5.7"
  instance_class                       = values.instance_class
  allocated_storage                    = 5
  db_name                              = values.db_name
  username                             = values.username
  port                                 = "3306"
  iam_database_authentication_enabled  = true
  vpc_security_group_ids               = values.vpc_security_group_ids
  tags = {
    Owner       = "user"
  }

  create_db_subnet_group              = true
  subnet_ids                          = values.subnet_ids
  family                              = "mysql8.0"
  major_engine_version                = "8.0"
  deletion_protection                 = true

}


