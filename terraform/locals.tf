################################################################################
##### Locals
################################################################################

locals {
  vpc_enable_dns_hostnames                 = true
  vpc_enable_dns_support                   = true
  vpc_enable_dhcp_options                  = true
  vpc_dhcp_options_domain_name             = var.domain_name
  vpc_enable_flow_log                      = true
  vpc_create_flow_log_cloudwatch_log_group = true
  vpc_create_flow_log_cloudwatch_iam_role  = true
  vpc_enable_peering_dns_resolution        = true

  az_names_use1  = data.aws_availability_zones.use1.names
  az_names_use2  = data.aws_availability_zones.use2.names
  az_names_usw1  = data.aws_availability_zones.usw1.names
  az_names_usw2  = data.aws_availability_zones.usw2.names
  az_names_ape1  = data.aws_availability_zones.ape1.names
  az_names_aps1  = data.aws_availability_zones.aps1.names
  az_names_apne1 = data.aws_availability_zones.apne1.names
  az_names_apne2 = data.aws_availability_zones.apne2.names
  az_names_apse1 = data.aws_availability_zones.apse1.names
  az_names_apse2 = data.aws_availability_zones.apse2.names
  az_names_cac1  = data.aws_availability_zones.cac1.names
  az_names_euc1  = data.aws_availability_zones.euc1.names
  az_names_euw1  = data.aws_availability_zones.euw1.names
  az_names_euw2  = data.aws_availability_zones.euw2.names
  az_names_euw3  = data.aws_availability_zones.euw3.names
  az_names_eun1  = data.aws_availability_zones.eun1.names
  az_names_mes1  = data.aws_availability_zones.mes1.names
  az_names_sae1  = data.aws_availability_zones.sae1.names

  master_vpc_name = format("%s-master", var.project_name)
  client_vpc_name = format("%s-client", var.project_name)

  master_cidr_offset = 192
  client_cidr_offset = 224

  master_use1_cidr = cidrsubnet(var.base_cidr, 8, local.master_cidr_offset + 0)
  master_use2_cidr = cidrsubnet(var.base_cidr, 8, local.master_cidr_offset + 1)
  master_usw1_cidr = cidrsubnet(var.base_cidr, 8, local.master_cidr_offset + 2)
  master_usw2_cidr = cidrsubnet(var.base_cidr, 8, local.master_cidr_offset + 3)

  client_use1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 0)
  client_use2_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 1)
  client_usw1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 2)
  client_usw2_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 3)
  client_ape1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 4)
  client_aps1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 5)
  client_apne1_cidr = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 6)
  client_apne2_cidr = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 7)
  client_apse1_cidr = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 8)
  client_apse2_cidr = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 9)
  client_cac1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 10)
  client_euc1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 11)
  client_euw1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 12)
  client_euw2_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 13)
  client_euw3_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 14)
  client_eun1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 15)
  client_mes1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 16)
  client_sae1_cidr  = cidrsubnet(var.base_cidr, 8, local.client_cidr_offset + 17)

  spot_instance_types = [
    "t2.micro",
    "t3.nano",
    "t3.micro",
    "t3a.nano",
    "t3a.micro",
  ]

  spot_instance_preferences = [
    "t2.micro",
    "t3.micro",
    "t3a.micro",
    "t3.nano",
    "t3a.nano",
  ]

  spot_instance_ami_regex           = "amzn2-ami-hvm-[0-9\\.]{1,}-x86_64-gp2"
  master_spot_instance_interruption = "stop"
  master_spot_instance_request_type = "persistent"
  client_spot_instance_interruption = "terminate"
  client_spot_instance_request_type = "one-time"
  client_spot_instance_profile      = "ec2_ssm_role"
}
