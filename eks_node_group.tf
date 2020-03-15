resource "aws_eks_node_group" "alxmedium_eks_node_group" {
  cluster_name    = aws_eks_cluster.alxmedium_eks_cluster.name
  node_group_name = "alxmedium_eks_node_group"
  node_role_arn   = aws_iam_role.alxmedium_eks_node_group_role.arn
  subnet_ids      = [aws_subnet.alxmedium_subnet_1.id, aws_subnet.alxmedium_subnet_2.id, aws_subnet.alxmedium_subnet_3.id, aws_subnet.alxmedium_subnet_4.id]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.alxmedium_eks_node_group_role_attach_amazoneksworkernode_policy,
    aws_iam_role_policy_attachment.alxmedium_eks_node_group_role_attach_amazonekscni_policy,
    aws_iam_role_policy_attachment.alxmedium_eks_node_group_role_attach_amazonec2containerresgitryonly_policy,
  ]

  tags = {
    Name                                          = "alxmedium_eks_node_group"
    "kubernetes.io/cluster/alxmedium_eks_cluster" = "shared"
  }
}