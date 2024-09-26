resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current}-a"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "public-subnet-1a",
    "kubernetes.io/role/elb" = 1
  }
}


resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current}-b"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "public-subnet-1b",
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_public_1c" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone       = "${data.aws_region.current}-c"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "public-subnet-1c",
    "kubernetes.io/role/elb" = 1
  }
}
