variable "allocated_storage" {
  type = number
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string

}

variable "identifier_prefix" {
  type    = string
  default = "dev"
}

variable "identifier_class" {
  type    = string
  default = "db.t3.small"
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "pg_password_secret_name" {
  type = string
}

variable "pg_password_secret_key" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "db_subnet_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type = string
}
