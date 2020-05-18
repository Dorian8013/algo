##### To US East (N. Virginia) us-east-1
resource "aws_vpc_peering_connection" "euw2_use1" {
  provider = aws.euw2

  vpc_id      = module.client_euw2.vpc_id
  peer_vpc_id = module.master_use1.vpc_id
  peer_region = "us-east-1"
  auto_accept = false
}

resource "aws_vpc_peering_connection_accepter" "euw2_use1" {
  provider = aws.use1

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use1.id
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "requester_euw2_use1" {
  provider = aws.euw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use1.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use1]
}

resource "aws_vpc_peering_connection_options" "accepter_euw2_use1" {
  provider = aws.use1

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use1.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use1]
}

resource "aws_route" "requester_euw2_use1" {
  count = length(module.client_euw2.public_route_table_ids)

  provider = aws.euw2

  route_table_id            = module.client_euw2.public_route_table_ids[count.index]
  destination_cidr_block    = module.master_use1.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use1.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use1]
}

resource "aws_route" "accepter_euw2_use1" {
  count = length(module.master_use1.public_route_table_ids)

  provider = aws.use1

  route_table_id            = module.master_use1.public_route_table_ids[count.index]
  destination_cidr_block    = module.client_euw2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use1.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use1]
}

##### To US East (Ohio) us-east-2
resource "aws_vpc_peering_connection" "euw2_use2" {
  provider = aws.euw2

  vpc_id      = module.client_euw2.vpc_id
  peer_vpc_id = module.master_use2.vpc_id
  peer_region = "us-east-2"
  auto_accept = false
}

resource "aws_vpc_peering_connection_accepter" "euw2_use2" {
  provider = aws.use2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use2.id
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "requester_euw2_use2" {
  provider = aws.euw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use2.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use2]
}

resource "aws_vpc_peering_connection_options" "accepter_euw2_use2" {
  provider = aws.use2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use2.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use2]
}

resource "aws_route" "requester_euw2_use2" {
  count = length(module.client_euw2.public_route_table_ids)

  provider = aws.euw2

  route_table_id            = module.client_euw2.public_route_table_ids[count.index]
  destination_cidr_block    = module.master_use2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use2.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use2]
}

resource "aws_route" "accepter_euw2_use2" {
  count = length(module.master_use2.public_route_table_ids)

  provider = aws.use2

  route_table_id            = module.master_use2.public_route_table_ids[count.index]
  destination_cidr_block    = module.client_euw2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_use2.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_use2]
}

##### To US West (N. California) us-west-1
resource "aws_vpc_peering_connection" "euw2_usw1" {
  provider = aws.euw2

  vpc_id      = module.client_euw2.vpc_id
  peer_vpc_id = module.master_usw1.vpc_id
  peer_region = "us-west-1"
  auto_accept = false
}

resource "aws_vpc_peering_connection_accepter" "euw2_usw1" {
  provider = aws.usw1

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw1.id
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "requester_euw2_usw1" {
  provider = aws.euw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw1.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw1]
}

resource "aws_vpc_peering_connection_options" "accepter_euw2_usw1" {
  provider = aws.usw1

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw1.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw1]
}

resource "aws_route" "requester_euw2_usw1" {
  count = length(module.client_euw2.public_route_table_ids)

  provider = aws.euw2

  route_table_id            = module.client_euw2.public_route_table_ids[count.index]
  destination_cidr_block    = module.master_usw1.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw1.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw1]
}

resource "aws_route" "accepter_euw2_usw1" {
  count = length(module.master_usw1.public_route_table_ids)

  provider = aws.usw1

  route_table_id            = module.master_usw1.public_route_table_ids[count.index]
  destination_cidr_block    = module.client_euw2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw1.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw1]
}

##### To US West (Oregon) us-west-2
resource "aws_vpc_peering_connection" "euw2_usw2" {
  provider = aws.euw2

  vpc_id      = module.client_euw2.vpc_id
  peer_vpc_id = module.master_usw2.vpc_id
  peer_region = "us-west-2"
  auto_accept = false
}

resource "aws_vpc_peering_connection_accepter" "euw2_usw2" {
  provider = aws.usw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw2.id
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "requester_euw2_usw2" {
  provider = aws.euw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw2.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw2]
}

resource "aws_vpc_peering_connection_options" "accepter_euw2_usw2" {
  provider = aws.usw2

  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw2.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw2]
}

resource "aws_route" "requester_euw2_usw2" {
  count = length(module.client_euw2.public_route_table_ids)

  provider = aws.euw2

  route_table_id            = module.client_euw2.public_route_table_ids[count.index]
  destination_cidr_block    = module.master_usw2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw2.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw2]
}

resource "aws_route" "accepter_euw2_usw2" {
  count = length(module.master_usw2.public_route_table_ids)

  provider = aws.usw2

  route_table_id            = module.master_usw2.public_route_table_ids[count.index]
  destination_cidr_block    = module.client_euw2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.euw2_usw2.id

  depends_on = [aws_vpc_peering_connection_accepter.euw2_usw2]
}
