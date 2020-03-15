resource "aws_security_group" "alxmedium_eks_cluster_security_group" {
  name   = "alxmedium_eks_cluster_security_group"
  vpc_id = aws_vpc.alxmedium_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ip_connection_machine]
  }

  tags = {
    Name = "alxmedium_eks_cluster_security_group"
  }
}