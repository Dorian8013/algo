################################################################################
##### Client Spot Instances
################################################################################

data "local_file" "master_ips" {
  count = var.launch_test_spot_instances ? 1 : 0
  
  filename = format("%s/scripts/master_ips.txt", path.module)

  depends_on = [local_file.master_ips]
}

data "template_cloudinit_config" "client" {
  count = var.launch_test_spot_instances ? 1 : 0
  
  base64_encode = true
  gzip          = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOT
    write_files:
      - encoding: b64
        content: ${data.local_file.master_ips[0].content_base64}
        path: /tmp/master_ips.txt
        owner: root:root
        permissions: '0400'
    EOT
  }

  part {
    content_type = "text/x-shellscript"
    content      = file(format("%s/scripts/client_user-data.sh", path.module))
  }
}

resource "aws_spot_instance_request" "client_use1" {
  provider = aws.use1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.use1.names) : 0

  ami                  = data.aws_ami.use1.id
  instance_type        = data.aws_ec2_instance_type_offering.use1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.use1.names[count.index]
  subnet_id                   = module.client_use1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_use2" {
  provider = aws.use2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.use2.names) : 0

  ami                  = data.aws_ami.use2.id
  instance_type        = data.aws_ec2_instance_type_offering.use2[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.use2.names[count.index]
  subnet_id                   = module.client_use2.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_usw1" {
  provider = aws.usw1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.usw1.names) : 0

  ami                  = data.aws_ami.usw1.id
  instance_type        = data.aws_ec2_instance_type_offering.usw1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.usw1.names[count.index]
  subnet_id                   = module.client_usw1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_usw2" {
  provider = aws.usw2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.usw2.names) : 0

  ami                  = data.aws_ami.usw2.id
  instance_type        = data.aws_ec2_instance_type_offering.usw2[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.usw2.names[count.index]
  subnet_id                   = module.client_usw2.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_ape1" {
  provider = aws.ape1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.ape1.names) : 0

  ami                  = data.aws_ami.ape1.id
  instance_type        = data.aws_ec2_instance_type_offering.ape1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.ape1.names[count.index]
  subnet_id                   = module.client_ape1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_aps1" {
  provider = aws.aps1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.aps1.names) : 0

  ami                  = data.aws_ami.aps1.id
  instance_type        = data.aws_ec2_instance_type_offering.aps1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.aps1.names[count.index]
  subnet_id                   = module.client_aps1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_apne1" {
  provider = aws.apne1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.apne1.names) : 0

  ami                  = data.aws_ami.apne1.id
  instance_type        = data.aws_ec2_instance_type_offering.apne1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.apne1.names[count.index]
  subnet_id                   = module.client_apne1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_apne2" {
  provider = aws.apne2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.apne2.names) : 0

  ami                  = data.aws_ami.apne2.id
  instance_type        = data.aws_ec2_instance_type_offering.apne2[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.apne2.names[count.index]
  subnet_id                   = module.client_apne2.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_apse1" {
  provider = aws.apse1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.apse1.names) : 0

  ami                  = data.aws_ami.apse1.id
  instance_type        = data.aws_ec2_instance_type_offering.apse1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.apse1.names[count.index]
  subnet_id                   = module.client_apse1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_apse2" {
  provider = aws.apse2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.apse2.names) : 0

  ami                  = data.aws_ami.apse2.id
  instance_type        = data.aws_ec2_instance_type_offering.apse2[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.apse2.names[count.index]
  subnet_id                   = module.client_apse2.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_cac1" {
  provider = aws.cac1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.cac1.names) : 0

  ami                  = data.aws_ami.cac1.id
  instance_type        = data.aws_ec2_instance_type_offering.cac1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.cac1.names[count.index]
  subnet_id                   = module.client_cac1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_euc1" {
  provider = aws.euc1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.euc1.names) : 0

  ami                  = data.aws_ami.euc1.id
  instance_type        = data.aws_ec2_instance_type_offering.euc1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.euc1.names[count.index]
  subnet_id                   = module.client_euc1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_euw1" {
  provider = aws.euw1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.euw1.names) : 0

  ami                  = data.aws_ami.euw1.id
  instance_type        = data.aws_ec2_instance_type_offering.euw1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.euw1.names[count.index]
  subnet_id                   = module.client_euw1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_euw2" {
  provider = aws.euw2

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.euw2.names) : 0

  ami                  = data.aws_ami.euw2.id
  instance_type        = data.aws_ec2_instance_type_offering.euw2[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.euw2.names[count.index]
  subnet_id                   = module.client_euw2.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_euw3" {
  provider = aws.euw3

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.euw3.names) : 0

  ami                  = data.aws_ami.euw3.id
  instance_type        = data.aws_ec2_instance_type_offering.euw3[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.euw3.names[count.index]
  subnet_id                   = module.client_euw3.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_eun1" {
  provider = aws.eun1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.eun1.names) : 0

  ami                  = data.aws_ami.eun1.id
  instance_type        = data.aws_ec2_instance_type_offering.eun1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.eun1.names[count.index]
  subnet_id                   = module.client_eun1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_mes1" {
  provider = aws.mes1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.mes1.names) : 0

  ami                  = data.aws_ami.mes1.id
  instance_type        = data.aws_ec2_instance_type_offering.mes1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.mes1.names[count.index]
  subnet_id                   = module.client_mes1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}

resource "aws_spot_instance_request" "client_sae1" {
  provider = aws.sae1

  count = var.launch_test_spot_instances ? length(data.aws_availability_zones.sae1.names) : 0

  ami                  = data.aws_ami.sae1.id
  instance_type        = data.aws_ec2_instance_type_offering.sae1[count.index].instance_type
  user_data            = data.template_cloudinit_config.client[0].rendered
  iam_instance_profile = local.client_spot_instance_profile

  availability_zone           = data.aws_availability_zones.sae1.names[count.index]
  subnet_id                   = module.client_sae1.public_subnets[count.index]
  associate_public_ip_address = true

  instance_initiated_shutdown_behavior = local.client_spot_instance_interruption
  instance_interruption_behaviour      = local.client_spot_instance_interruption
  spot_type                            = local.client_spot_instance_request_type

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }
}
