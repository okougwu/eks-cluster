variable "region" {
  description = "AWS region where the resources will be created."
  type        = string
}

variable "cluster_name" {
  description = "Name for your EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.21"
}
