variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Prefix used in resource names"
  type        = string
  default     = "drupal-ha"
}
variable "allowed_ssh_cidr" {
  description = "Your public IP, the only address allowed to SSH in"
  type        = string
  default     = "102.90.0.0/16"
}
variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
variable "db_multi_az" {
  description = "Keep a standby database in a second AZ (costs extra)"
  type        = bool
  default     = false
}