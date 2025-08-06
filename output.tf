output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${var.cluster_name} --profile ${var.aws_profile}"
}
