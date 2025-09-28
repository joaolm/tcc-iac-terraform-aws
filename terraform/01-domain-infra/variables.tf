variable "aws_region" {
  description = "Região da AWS para a infraestrutura principal."
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "O nome do domínio para criar a Hosted Zone no Route 53."
  type        = string
  default     = "devops.log.br"
}