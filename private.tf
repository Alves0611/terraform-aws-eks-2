resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
    Name                              = "private-subnet-1a",
    "kubernetes.io/role/internal-elb" = 1
  }
}


resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 5)
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name                              = "private-subnet-1b",
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_private_1c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 6)
  availability_zone = "${data.aws_region.current.name}c"

  tags = {
    Name                              = "private-subnet-1c",
    "kubernetes.io/role/internal-elb" = 1
  }
}
