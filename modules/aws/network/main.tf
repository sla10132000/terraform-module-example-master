resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_config.cidr_block
  enable_dns_support   = var.vpc_config.enable_dns_support
  enable_dns_hostnames = var.vpc_config.enable_dns_hostnames

  tags = {
    Name = "vpc-${var.project_config.name}-${var.project_config.service}-${var.project_config.environment}"
  }
}

resource "aws_subnet" "public" {
  for_each                = var.subnet_config.public.subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = var.subnet_config.public.map_public_ip_on_launch

  tags = {
    Name = "subnet-${var.project_config.name}-${var.project_config.service}-${var.project_config.environment}-public-${substr(each.key, -2, 0)}"
  }
}

resource "aws_subnet" "private" {
  for_each                = var.subnet_config.private.subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = var.subnet_config.private.map_public_ip_on_launch

  tags = {
    Name = "subnet-${var.project_config.name}-${var.project_config.service}-${var.project_config.environment}-private-${substr(each.key, -2, 0)}"
  }
}