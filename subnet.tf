resource "aws_subnet" "alxmedium_subnet_1" {
  vpc_id               = aws_vpc.alxmedium_vpc.id
  cidr_block           = "10.0.0.0/24"
  availability_zone_id = "use1-az1"

  tags = {
    Name                                          = "alxmedium_subnet_1"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }
}

resource "aws_subnet" "alxmedium_subnet_2" {
  vpc_id               = aws_vpc.alxmedium_vpc.id
  cidr_block           = "10.0.1.0/24"
  availability_zone_id = "use1-az2"

  tags = {
    Name                                          = "alxmedium_subnet_2"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }
}

resource "aws_subnet" "alxmedium_subnet_3" {
  vpc_id               = aws_vpc.alxmedium_vpc.id
  cidr_block           = "10.0.2.0/24"
  availability_zone_id = "use1-az3"

  tags = {
    Name                                          = "alxmedium_subnet_3"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

resource "aws_subnet" "alxmedium_subnet_4" {
  vpc_id               = aws_vpc.alxmedium_vpc.id
  cidr_block           = "10.0.3.0/24"
  availability_zone_id = "use1-az4"

  tags = {
    Name                                          = "alxmedium_subnet_4"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
} 