resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.this.id

  tags = (
    {
      Name = "${var.project_name}-igw"
    }
  )
}
