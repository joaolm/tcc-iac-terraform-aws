output "application_url" {
  description = "URL final da aplicação."
  value       = "https://${var.app_subdomain}.${var.domain_name}"
}

/* output "ecr_repository_url" {
  description = "URL do repositório ECR para enviar a imagem Docker."
  value       = aws_ecr_repository.todoism_repo.repository_url
} */