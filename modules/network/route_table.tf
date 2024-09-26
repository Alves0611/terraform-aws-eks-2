resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    {
      Name = "${var.project_name}-public-route-table"
    }
  )
}

resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1c" {
  subnet_id      = aws_subnet.eks_subnet_public_1c.id
  route_table_id = aws_route_table.eks_public_route_table.id
}
