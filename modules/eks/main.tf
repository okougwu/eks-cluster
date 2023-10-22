provider "aws" {
  region = var.region
  profile = "munachi"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "eks-nodes"
  subnet_ids      = var.subnet_ids
  instance_types  = ["t2.micro"]
  scaling_config {
    min_size     = 1
    desired_size = 2
    max_size     = 3
  }
  remote_access {
    ec2_ssh_key = "my-key-pair"
  }
  node_role_arn = "arn:aws:iam::658962143818:role/my_EKS_Cluster_role"
}