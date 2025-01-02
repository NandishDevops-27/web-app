resource "aws_iam_role" "master" {
  name = "eks-master"

  assume_role_policy = jsonencode({ 
    Statement = [{ 
        Action = "sts:AssumeRole" 
        Effect = "Allow" 
        Principal = { 
            Service = "eks.amazonaws.com" 
        } 
    }] 
    }) 
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.master.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.master.name
}

resource "aws_iam_instance_profile" "worker" {
  depends_on = [aws_iam_role.worker]
  name       = "ed-eks-worker-new-profile"
  role       = aws_iam_role.worker.name
}