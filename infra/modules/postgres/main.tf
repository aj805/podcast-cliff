resource "aws_db_instance" "postgres" {
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.db_name # Changed from 'name' to 'identifier'
  username               = var.username
  password               = sensitive(local.pg_password)
  db_name                = var.db_name
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
}
