################################################################################
##### Data
################################################################################

data "aws_ami" "use1" {
  provider = aws.use1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "use2" {
  provider = aws.use2

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "usw1" {
  provider = aws.usw1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "usw2" {
  provider = aws.usw2

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "ape1" {
  provider = aws.ape1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "aps1" {
  provider = aws.aps1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "apne1" {
  provider = aws.apne1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "apne2" {
  provider = aws.apne2

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "apse1" {
  provider = aws.apse1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "apse2" {
  provider = aws.apse2

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "cac1" {
  provider = aws.cac1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "euc1" {
  provider = aws.euc1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "euw1" {
  provider = aws.euw1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "euw2" {
  provider = aws.euw2

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "euw3" {
  provider = aws.euw3

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "eun1" {
  provider = aws.eun1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "mes1" {
  provider = aws.mes1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_ami" "sae1" {
  provider = aws.sae1

  owners      = ["amazon"]
  most_recent = true
  name_regex  = local.spot_instance_ami_regex
}

data "aws_availability_zones" "use1" {
  provider = aws.use1
}

data "aws_availability_zones" "use2" {
  provider = aws.use2
}

data "aws_availability_zones" "usw1" {
  provider = aws.usw1
}

data "aws_availability_zones" "usw2" {
  provider = aws.usw2
}

data "aws_availability_zones" "ape1" {
  provider = aws.ape1
}

data "aws_availability_zones" "aps1" {
  provider = aws.aps1
}

data "aws_availability_zones" "apne1" {
  provider = aws.apne1
}

data "aws_availability_zones" "apne2" {
  provider = aws.apne2
}

data "aws_availability_zones" "apse1" {
  provider = aws.apse1
}

data "aws_availability_zones" "apse2" {
  provider = aws.apse2
}

data "aws_availability_zones" "cac1" {
  provider = aws.cac1
}

data "aws_availability_zones" "euc1" {
  provider = aws.euc1
}

data "aws_availability_zones" "euw1" {
  provider = aws.euw1
}

data "aws_availability_zones" "euw2" {
  provider = aws.euw2
}

data "aws_availability_zones" "euw3" {
  provider = aws.euw3
}

data "aws_availability_zones" "eun1" {
  provider = aws.eun1
}

data "aws_availability_zones" "mes1" {
  provider = aws.mes1
}

data "aws_availability_zones" "sae1" {
  provider = aws.sae1
}

data "aws_ec2_instance_type_offering" "use1" {
  provider = aws.use1

  count = length(data.aws_availability_zones.use1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.use1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "use2" {
  provider = aws.use2

  count = length(data.aws_availability_zones.use2.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.use2.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "usw1" {
  provider = aws.usw1

  count = length(data.aws_availability_zones.usw1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.usw1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "usw2" {
  provider = aws.usw2

  count = length(data.aws_availability_zones.usw2.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.usw2.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "ape1" {
  provider = aws.ape1

  count = length(data.aws_availability_zones.ape1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.ape1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "aps1" {
  provider = aws.aps1

  count = length(data.aws_availability_zones.aps1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.aps1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "apne1" {
  provider = aws.apne1

  count = length(data.aws_availability_zones.apne1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.apne1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "apne2" {
  provider = aws.apne2

  count = length(data.aws_availability_zones.apne2.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.apne2.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "apse1" {
  provider = aws.apse1

  count = length(data.aws_availability_zones.apse1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.apse1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "apse2" {
  provider = aws.apse2

  count = length(data.aws_availability_zones.apse2.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.apse2.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "cac1" {
  provider = aws.cac1

  count = length(data.aws_availability_zones.cac1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.cac1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "euc1" {
  provider = aws.euc1

  count = length(data.aws_availability_zones.euc1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.euc1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "euw1" {
  provider = aws.euw1

  count = length(data.aws_availability_zones.euw1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.euw1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "euw2" {
  provider = aws.euw2

  count = length(data.aws_availability_zones.euw2.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.euw2.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "euw3" {
  provider = aws.euw3

  count = length(data.aws_availability_zones.euw3.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.euw3.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "eun1" {
  provider = aws.eun1

  count = length(data.aws_availability_zones.eun1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.eun1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "mes1" {
  provider = aws.mes1

  count = length(data.aws_availability_zones.mes1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.mes1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}

data "aws_ec2_instance_type_offering" "sae1" {
  provider = aws.sae1

  count = length(data.aws_availability_zones.sae1.names)

  filter {
    name   = "instance-type"
    values = local.spot_instance_types
  }

  filter {
    name   = "location"
    values = [data.aws_availability_zones.sae1.names[count.index]]
  }

  location_type            = "availability-zone"
  preferred_instance_types = local.spot_instance_preferences
}
