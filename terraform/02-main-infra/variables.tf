variable "aws_region" {
  description = "Região da AWS para a infraestrutura principal."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto, usado para nomear recursos."
  type        = string
  default     = "todoism-tcc"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_password" {
  description = "Senha para o banco de dados RDS."
  type        = string
  sensitive   = true # Marca a variável como sensível para não aparecer nos logs
}

variable "domain_name" {
  description = "Nome do domínio principal (ex: devops.log.br)."
  type        = string
  default     = "devops.log.br"
}

variable "app_subdomain" {
  description = "Subdomínio para a aplicação (ex: todoism)."
  type        = string
  default     = "todoism"
}
