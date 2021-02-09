####################################
# DB SUBNET GROUP     
####################################
output "db_subnet_group_id" {
  description = "The db subnet group name."
  value       = aws_db_subnet_group.this.id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group."
  value       = aws_db_subnet_group.this.arn
}

####################################
# DB INSTANCE     
####################################
output "db_instance_address" {
  description = "The hostname of the RDS instance. See also endpoint and port."
  value       = aws_db_instance.this.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance."
  value       = aws_db_instance.this.arn
}

output "db_instance_allocated_storage" {
  description = "The amount of allocated storage."
  value       = aws_db_instance.this.allocated_storage
}

output "db_instance_availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_db_instance.this.availability_zone
}

output "db_instance_backup_retention_period" {
  description = "The backup retention period."
  value       = aws_db_instance.this.backup_retention_period
}

output "db_instance_backup_window" {
  description = "The backup window."
  value       = aws_db_instance.this.backup_window
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = aws_db_instance.this.ca_cert_identifier
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = aws_db_instance.this.domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service."
  value       = aws_db_instance.this.domain_iam_role_name
}

output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format."
  value       = aws_db_instance.this.endpoint
}

output "db_instance_engine" {
  description = "The database engine."
  value       = aws_db_instance.this.engine
}

output "db_instance_engine_version" {
  description = "The database engine version."
  value       = aws_db_instance.this.engine_version
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = aws_db_instance.this.hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID."
  value       = aws_db_instance.this.id
}

output "db_instance_class" {
  description = "The RDS instance class."
  value       = aws_db_instance.this.instance_class
}

output "db_instance_latest_restorable_time" {
  description = "The latest time, in UTC RFC3339 format, to which a database can be restored with point-in-time restore."
  value       = aws_db_instance.this.latest_restorable_time
}

output "db_instance_maintenance_window" {
  description = "The instance maintenance window."
  value       = aws_db_instance.this.maintenance_window
}

output "db_instance_multi_az" {
  description = "If the RDS instance is multi AZ enabled."
  value       = aws_db_instance.this.multi_az
}

output "db_instance_name" {
  description = "The database name."
  value       = aws_db_instance.this.name
}

output "db_instance_port" {
  description = "The database port."
  value       = aws_db_instance.this.port
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance."
  value       = aws_db_instance.this.resource_id
}

output "db_instance_status" {
  description = "The RDS instance status."
  value       = aws_db_instance.this.status
}

output "db_instance_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted."
  value       = aws_db_instance.this.storage_encrypted
}

output "db_instance_username" {
  description = "The master username for the database."
  value       = aws_db_instance.this.username
}
