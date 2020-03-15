resource "aws_iam_role" "alxmedium_eks_cluster_role" {
  name = "alxmedium_eks_cluster_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  force_detach_policies = true

  tags = {
    Name = "alxmedium_eks_cluster_role"
  }
}

resource "aws_iam_role_policy_attachment" "alxmedium_eks_cluster_role_attach_amazonekscluster_policy" {
  role       = aws_iam_role.alxmedium_eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "alxmedium_eks_cluster_role_attach_amazoneksservice_policy" {
  role       = aws_iam_role.alxmedium_eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role" "alxmedium_eks_node_group_role" {
  name = "alxmedium_eks_node_group_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  force_detach_policies = true

  tags = {
    Name = "alxmedium_eks_node_group_role"
  }
}

resource "aws_iam_role_policy_attachment" "alxmedium_eks_node_group_role_attach_amazoneksworkernode_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.alxmedium_eks_node_group_role.name
}

resource "aws_iam_role_policy_attachment" "alxmedium_eks_node_group_role_attach_amazonekscni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.alxmedium_eks_node_group_role.name
}

resource "aws_iam_role_policy_attachment" "alxmedium_eks_node_group_role_attach_amazonec2containerresgitryonly_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.alxmedium_eks_node_group_role.name
}