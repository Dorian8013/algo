################################################################################
##### Route53
################################################################################

resource "aws_route53_zone" "this" {
  provider = aws.use1

  name = var.domain_name

  vpc {
    vpc_id = module.master_use1.vpc_id
  }

  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone_association" "master_use2" {
  provider = aws.use2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.master_use2.vpc_id
}

resource "aws_route53_zone_association" "master_usw1" {
  provider = aws.usw1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.master_usw1.vpc_id
}

resource "aws_route53_zone_association" "master_usw2" {
  provider = aws.usw2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.master_usw2.vpc_id
}

resource "aws_route53_zone_association" "client_use1" {
  provider = aws.use1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_use1.vpc_id
}

resource "aws_route53_zone_association" "client_use2" {
  provider = aws.use2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_use2.vpc_id
}

resource "aws_route53_zone_association" "client_usw1" {
  provider = aws.usw1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_usw1.vpc_id
}

resource "aws_route53_zone_association" "client_usw2" {
  provider = aws.usw2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_usw2.vpc_id
}

resource "aws_route53_zone_association" "client_ape1" {
  provider = aws.ape1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_ape1.vpc_id
}

resource "aws_route53_zone_association" "client_aps1" {
  provider = aws.aps1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_aps1.vpc_id
}

resource "aws_route53_zone_association" "client_apne1" {
  provider = aws.apne1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_apne1.vpc_id
}

resource "aws_route53_zone_association" "client_apne2" {
  provider = aws.apne2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_apne2.vpc_id
}

resource "aws_route53_zone_association" "client_apse1" {
  provider = aws.apse1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_apse1.vpc_id
}

resource "aws_route53_zone_association" "client_apse2" {
  provider = aws.apse2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_apse2.vpc_id
}

resource "aws_route53_zone_association" "client_cac1" {
  provider = aws.cac1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_cac1.vpc_id
}

resource "aws_route53_zone_association" "client_euc1" {
  provider = aws.euc1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_euc1.vpc_id
}

resource "aws_route53_zone_association" "client_euw1" {
  provider = aws.euw1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_euw1.vpc_id
}

resource "aws_route53_zone_association" "client_euw2" {
  provider = aws.euw2

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_euw2.vpc_id
}

resource "aws_route53_zone_association" "client_euw3" {
  provider = aws.euw3

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_euw3.vpc_id
}

resource "aws_route53_zone_association" "client_eun1" {
  provider = aws.eun1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_eun1.vpc_id
}

resource "aws_route53_zone_association" "client_mes1" {
  provider = aws.mes1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_mes1.vpc_id
}

resource "aws_route53_zone_association" "client_sae1" {
  provider = aws.sae1

  zone_id = aws_route53_zone.this.zone_id
  vpc_id  = module.client_sae1.vpc_id
}
