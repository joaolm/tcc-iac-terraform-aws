output "route53_zone_name_servers" {
  description = "Servidores de Nomes (NS) para configurar no registrador de domínio"
  value       = aws_route53_zone.main.name_servers
}

output "route53_zone_id" {
  description = "O ID da Hosted Zone criada."
  value       = aws_route53_zone.main.zone_id
}