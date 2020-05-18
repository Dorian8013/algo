################################################################################
##### Client Regions
################################################################################

##### US East (N. Virginia) us-east-1
module "client_use1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.use1
  }

  name = local.client_vpc_name
  cidr = local.client_use1_cidr

  azs            = local.az_names_use1
  public_subnets = [for n in range(length(local.az_names_use1)) : cidrsubnet(local.client_use1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_use1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### US East (Ohio) us-east-2
module "client_use2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.use2
  }

  name = local.client_vpc_name
  cidr = local.client_use2_cidr

  azs            = local.az_names_use2
  public_subnets = [for n in range(length(local.az_names_use2)) : cidrsubnet(local.client_use2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_use2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### US West (N. California) us-west-1
module "client_usw1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.usw1
  }

  name = local.client_vpc_name
  cidr = local.client_usw1_cidr

  azs            = local.az_names_usw1
  public_subnets = [for n in range(length(local.az_names_usw1)) : cidrsubnet(local.client_usw1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_usw1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### US West (Oregon) us-west-2
module "client_usw2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.usw2
  }

  name = local.client_vpc_name
  cidr = local.client_usw2_cidr

  azs            = local.az_names_usw2
  public_subnets = [for n in range(length(local.az_names_usw2)) : cidrsubnet(local.client_usw2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_usw2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Hong Kong) ap-east-1
module "client_ape1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.ape1
  }

  name = local.client_vpc_name
  cidr = local.client_ape1_cidr

  azs            = local.az_names_ape1
  public_subnets = [for n in range(length(local.az_names_ape1)) : cidrsubnet(local.client_ape1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_ape1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Mumbai) ap-south-1
module "client_aps1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.aps1
  }

  name = local.client_vpc_name
  cidr = local.client_aps1_cidr

  azs            = local.az_names_aps1
  public_subnets = [for n in range(length(local.az_names_aps1)) : cidrsubnet(local.client_aps1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_aps1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Seoul) ap-northeast-2
module "client_apne2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.apne2
  }

  name = local.client_vpc_name
  cidr = local.client_apne2_cidr

  azs            = local.az_names_apne2
  public_subnets = [for n in range(length(local.az_names_apne2)) : cidrsubnet(local.client_apne2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_apne2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Singapore) ap-southeast-1
module "client_apse1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.apse1
  }

  name = local.client_vpc_name
  cidr = local.client_apse1_cidr

  azs            = local.az_names_apse1
  public_subnets = [for n in range(length(local.az_names_apse1)) : cidrsubnet(local.client_apse1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_apse1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Sydney) ap-southeast-2
module "client_apse2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.apse2
  }

  name = local.client_vpc_name
  cidr = local.client_apse2_cidr

  azs            = local.az_names_apse2
  public_subnets = [for n in range(length(local.az_names_apse2)) : cidrsubnet(local.client_apse2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_apse2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Asia Pacific (Tokyo) ap-northeast-1
module "client_apne1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.apne1
  }

  name = local.client_vpc_name
  cidr = local.client_apne1_cidr

  azs            = local.az_names_apne1
  public_subnets = [for n in range(length(local.az_names_apne1)) : cidrsubnet(local.client_apne1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_apne1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Canada (Central) ca-central-1
module "client_cac1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.cac1
  }

  name = local.client_vpc_name
  cidr = local.client_cac1_cidr

  azs            = local.az_names_cac1
  public_subnets = [for n in range(length(local.az_names_cac1)) : cidrsubnet(local.client_cac1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_cac1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Europe (Frankfurt) eu-central-1
module "client_euc1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.euc1
  }

  name = local.client_vpc_name
  cidr = local.client_euc1_cidr

  azs            = local.az_names_euc1
  public_subnets = [for n in range(length(local.az_names_euc1)) : cidrsubnet(local.client_euc1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_euc1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Europe (Ireland) eu-west-1
module "client_euw1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.euw1
  }

  name = local.client_vpc_name
  cidr = local.client_euw1_cidr

  azs            = local.az_names_euw1
  public_subnets = [for n in range(length(local.az_names_euw1)) : cidrsubnet(local.client_euw1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_euw1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Europe (London) eu-west-2
module "client_euw2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.euw2
  }

  name = local.client_vpc_name
  cidr = local.client_euw2_cidr

  azs            = local.az_names_euw2
  public_subnets = [for n in range(length(local.az_names_euw2)) : cidrsubnet(local.client_euw2_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_euw2_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Europe (Paris) eu-west-3
module "client_euw3" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.euw3
  }

  name = local.client_vpc_name
  cidr = local.client_euw3_cidr

  azs            = local.az_names_euw3
  public_subnets = [for n in range(length(local.az_names_euw3)) : cidrsubnet(local.client_euw3_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_euw3_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Europe (Stockholm) eu-north-1
module "client_eun1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.eun1
  }

  name = local.client_vpc_name
  cidr = local.client_eun1_cidr

  azs            = local.az_names_eun1
  public_subnets = [for n in range(length(local.az_names_eun1)) : cidrsubnet(local.client_eun1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_eun1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### Middle East (Bahrain) me-south-1
module "client_mes1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.mes1
  }

  name = local.client_vpc_name
  cidr = local.client_mes1_cidr

  azs            = local.az_names_mes1
  public_subnets = [for n in range(length(local.az_names_mes1)) : cidrsubnet(local.client_mes1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_mes1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}

##### South America (Sao Paulo) sa-east-1
module "client_sae1" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.sae1
  }

  name = local.client_vpc_name
  cidr = local.client_sae1_cidr

  azs            = local.az_names_sae1
  public_subnets = [for n in range(length(local.az_names_sae1)) : cidrsubnet(local.client_sae1_cidr, 3, n)]

  enable_dns_hostnames = local.vpc_enable_dns_hostnames
  enable_dns_support   = local.vpc_enable_dns_support

  enable_dhcp_options              = local.vpc_enable_dhcp_options
  dhcp_options_domain_name         = local.vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = [cidrhost(local.client_sae1_cidr, 2)]

  enable_flow_log                      = local.vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = local.vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = local.vpc_create_flow_log_cloudwatch_iam_role
}
