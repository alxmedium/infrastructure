resource "aws_eks_cluster" "alxmedium_eks_cluster" {
  name     = "alxmedium_eks_cluster"
  role_arn = aws_iam_role.alxmedium_eks_cluster_role.arn

  vpc_config {
    subnet_ids         = [aws_subnet.alxmedium_subnet_1.id, aws_subnet.alxmedium_subnet_2.id, aws_subnet.alxmedium_subnet_3.id, aws_subnet.alxmedium_subnet_4.id]
    security_group_ids = [aws_security_group.alxmedium_eks_cluster_security_group.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.alxmedium_eks_cluster_role_attach_amazonekscluster_policy,
    aws_iam_role_policy_attachment.alxmedium_eks_cluster_role_attach_amazoneksservice_policy
  ]

  tags = {
    Name = "alxmedium_eks_cluster"
  }
}
