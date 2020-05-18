variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
}

variable "base_cidr" {
  description = "The starting CIDR block used for the VPCs"
  type        = string
  default     = "10.255.0.0/16"
}

variable "domain_name" {
  description = "Domain name for the DNS zone"
  type        = string
}

variable "launch_test_spot_instances" {
  description = "Whether or not to launch test spot instances"
  type        = bool
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ralgo"
}
