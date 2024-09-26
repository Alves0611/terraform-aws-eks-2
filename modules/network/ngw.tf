resource "aws_eip" "eks_ngw_eip_1a" {
  vpc = true
  tags = (
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_1b" {
  vpc = true
  tags = (
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_1c" {
  vpc = true
  tags = (
    {
      Name = "${var.project_name}-eip-1c"
    }
  )
}


resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = (
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = (
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1c" {
  allocation_id = aws_eip.eks_ngw_eip_1c.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = (
    {
      Name = "${var.project_name}-ngw-1c"
    }
  )
}
