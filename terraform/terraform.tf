provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
  alias   = "use1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "us-east-2"
  alias   = "use2"
}

provider "aws" {
  profile = var.aws_profile
  region  = "us-west-1"
  alias   = "usw1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "us-west-2"
  alias   = "usw2"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-east-1"
  alias   = "ape1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-south-1"
  alias   = "aps1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-northeast-1"
  alias   = "apne1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-northeast-2"
  alias   = "apne2"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-southeast-1"
  alias   = "apse1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ap-southeast-2"
  alias   = "apse2"
}

provider "aws" {
  profile = var.aws_profile
  region  = "ca-central-1"
  alias   = "cac1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "eu-central-1"
  alias   = "euc1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "eu-west-1"
  alias   = "euw1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "eu-west-2"
  alias   = "euw2"
}

provider "aws" {
  profile = var.aws_profile
  region  = "eu-west-3"
  alias   = "euw3"
}

provider "aws" {
  profile = var.aws_profile
  region  = "eu-north-1"
  alias   = "eun1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "me-south-1"
  alias   = "mes1"
}

provider "aws" {
  profile = var.aws_profile
  region  = "sa-east-1"
  alias   = "sae1"
}
