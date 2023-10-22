variable "region" {
  description = "AWS region where the EKS cluster will be created."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets for the EKS cluster."
  type        = list(string)
}

variable "cluster_name" {
  description = "Name for your EKS cluster."
  type        = string
  default     = "my-eks-cluster"  # You can change the default value as needed
}
