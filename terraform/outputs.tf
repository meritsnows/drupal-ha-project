output "alb_dns_name" {
  description = "Web address of the load balancer"
  value       = aws_lb.main.dns_name
}

output "db_endpoint" {
  description = "Address of the MySQL database"
  value       = aws_db_instance.drupal.address
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}