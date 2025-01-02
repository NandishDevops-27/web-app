resource "aws_eks_cluster" "eks" {
  name     = "web-app-eks"
  role_arn = aws_iam_role.master.arn

  vpc_config {
    subnet_ids = [aws_subnet.public-1.id, aws_subnet.publci-2.id]
  }


  depends_on = [
      aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
      aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    ]
}  