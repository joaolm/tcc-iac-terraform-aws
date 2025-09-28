data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_route53_zone" "primary" {
  name         = var.domain_name
  private_zone = false
}

data "aws_ecr_repository" "todoism_repo" {
  name = "${var.project_name}-repo"
}