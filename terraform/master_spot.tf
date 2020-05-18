################################################################################
##### Master Spot Instances
################################################################################

resource "aws_spot_instance_request" "master_use1" {
  provider = aws.use1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.use1.names) : 0

  ami           = data.aws_ami.use1.id
  instance_type = data.aws_ec2_instance_type_offering.use1[count.index].instance_type

  availability_zone           = data.aws_availability_zones.use1.names[count.index]
  subnet_id                   = module.master_use1.public_subnets[count.index]
  associate_public_ip_address = true
  private_ip                  = cidrhost(module.master_use1.public_subnets_cidr_blocks[count.index], 5)
  vpc_security_group_ids      = [aws_default_security_group.master_use1.id]

  instance_initiated_shutdown_behavior = local.master_spot_instance_interruption
  instance_interruption_behaviour      = local.master_spot_instance_interruption
  spot_type                            = local.master_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "master_use2" {
  provider = aws.use2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.use2.names) : 0

  ami           = data.aws_ami.use2.id
  instance_type = data.aws_ec2_instance_type_offering.use2[count.index].instance_type

  availability_zone           = data.aws_availability_zones.use2.names[count.index]
  subnet_id                   = module.master_use2.public_subnets[count.index]
  associate_public_ip_address = true
  private_ip                  = cidrhost(module.master_use2.public_subnets_cidr_blocks[count.index], 5)
  vpc_security_group_ids      = [aws_default_security_group.master_use2.id]

  instance_initiated_shutdown_behavior = local.master_spot_instance_interruption
  instance_interruption_behaviour      = local.master_spot_instance_interruption
  spot_type                            = local.master_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "master_usw1" {
  provider = aws.usw1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.usw1.names) : 0

  ami           = data.aws_ami.usw1.id
  instance_type = data.aws_ec2_instance_type_offering.usw1[count.index].instance_type

  availability_zone           = data.aws_availability_zones.usw1.names[count.index]
  subnet_id                   = module.master_usw1.public_subnets[count.index]
  associate_public_ip_address = true
  private_ip                  = cidrhost(module.master_usw1.public_subnets_cidr_blocks[count.index], 5)
  vpc_security_group_ids      = [aws_default_security_group.master_usw1.id]

  instance_initiated_shutdown_behavior = local.master_spot_instance_interruption
  instance_interruption_behaviour      = local.master_spot_instance_interruption
  spot_type                            = local.master_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "master_usw2" {
  provider = aws.usw2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.usw2.names) : 0

  ami           = data.aws_ami.usw2.id
  instance_type = data.aws_ec2_instance_type_offering.usw2[count.index].instance_type

  availability_zone           = data.aws_availability_zones.usw2.names[count.index]
  subnet_id                   = module.master_usw2.public_subnets[count.index]
  associate_public_ip_address = true
  private_ip                  = cidrhost(module.master_usw2.public_subnets_cidr_blocks[count.index], 5)
  vpc_security_group_ids      = [aws_default_security_group.master_usw2.id]

  instance_initiated_shutdown_behavior = local.master_spot_instance_interruption
  instance_interruption_behaviour      = local.master_spot_instance_interruption
  spot_type                            = local.master_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}
