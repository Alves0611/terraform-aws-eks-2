resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    "Name" = "${local.namespaced_service_name}-igw"
  }
}

resource "aws_subnet" "this" {
  for_each = local.subnets

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr_block
  availability_zone       = "${data.aws_region.current.name}${each.value.az}"
  map_public_ip_on_launch = each.value.public

  tags = merge(
    {
      "Name"                            = "${local.namespaced_service_name}-${each.value.name}",
      "kubernetes.io/role/elb"          = each.value.public ? "1" : null,
      "kubernetes.io/role/internal-elb" = each.value.public ? null : "1"
    },
    each.value.tags
  )
}

resource "aws_eip" "nat" {
  count  = 1
  domain = "vpc"
  tags = {
    "Name" = "${local.namespaced_service_name}-eip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat[0].id
  subnet_id     = element(local.public_subnet_ids, 0)
  tags = {
    "Name" = "${local.namespaced_service_name}-nat-gateway"
  }
}
