################################################################################
##### Master Regions
################################################################################

##### US East (N. Virginia) us-east-1
module "master_use1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.use1
  }

  name = local.master_vpc_name
  cidr = local.master_use1_cidr

  azs            = local.az_names_use1
  public_subnets = [for n in range(length(local.az_names_use1)) : cidrsubnet(local.master_use1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.master_use1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

resource "aws_default_security_group" "master_use1" {
  provider = aws.use1

  vpc_id                 = module.master_use1.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [cidrsubnet(var.base_cidr, 1, 1)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##### US East (Ohio) us-east-2
module "master_use2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.use2
  }

  name = local.master_vpc_name
  cidr = local.master_use2_cidr

  azs            = local.az_names_use2
  public_subnets = [for n in range(length(local.az_names_use2)) : cidrsubnet(local.master_use2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.master_use2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

resource "aws_default_security_group" "master_use2" {
  provider = aws.use2

  vpc_id                 = module.master_use2.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [cidrsubnet(var.base_cidr, 1, 1)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##### US West (N. California) us-west-1
module "master_usw1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.usw1
  }

  name = local.master_vpc_name
  cidr = local.master_usw1_cidr

  azs            = local.az_names_usw1
  public_subnets = [for n in range(length(local.az_names_usw1)) : cidrsubnet(local.master_usw1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.master_usw1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

resource "aws_default_security_group" "master_usw1" {
  provider = aws.usw1

  vpc_id                 = module.master_usw1.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [cidrsubnet(var.base_cidr, 1, 1)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##### US West (Oregon) us-west-2
module "master_usw2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.usw2
  }

  name = local.master_vpc_name
  cidr = local.master_usw2_cidr

  azs            = local.az_names_usw2
  public_subnets = [for n in range(length(local.az_names_usw2)) : cidrsubnet(local.master_usw2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.master_usw2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

resource "aws_default_security_group" "master_usw2" {
  provider = aws.usw2

  vpc_id                 = module.master_usw2.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [cidrsubnet(var.base_cidr, 1, 1)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
