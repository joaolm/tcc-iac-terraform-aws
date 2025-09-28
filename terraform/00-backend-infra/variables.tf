variable "aws_region" {
  type        = string
  description = "Região em que os recursos serão criados."
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Nome do bucket S3 para o estado do Terraform."
  type        = string
  default     = "tcc-iac-tfstate-2025-jlm-mrf"
}

variable "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB para o lock do estado."
  type        = string
  default     = "tcc-iac-tf-locks"
}
