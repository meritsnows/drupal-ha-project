resource "aws_efs_file_system" "drupal" {
  creation_token = "${var.project_name}-efs"
  encrypted      = true

  tags = {
    Name = "${var.project_name}-efs"
  }
}

resource "aws_security_group" "efs" {
  name        = "${var.project_name}-efs-sg"
  description = "Allow NFS only from the Drupal servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "NFS from the web servers only"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  tags = {
    Name = "${var.project_name}-efs-sg"
  }
}

resource "aws_efs_mount_target" "drupal" {
  count           = 2
  file_system_id  = aws_efs_file_system.drupal.id
  subnet_id       = aws_subnet.public[count.index].id
  security_groups = [aws_security_group.efs.id]
}

output "efs_id" {
  description = "ID of the shared file system"
  value       = aws_efs_file_system.drupal.id
}