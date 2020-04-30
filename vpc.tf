resource "aws_vpc" "alxmedium_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name                                          = "alxmedium_vpc"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
  }
}
