variable "common_tags" {
  description = "(Optional) Common tags for all the resources."
  type        = map(string)
  default     = {}
}

####################################
# DB SUBNET GROUP     
####################################
variable "db_subnet_group_name" {
  description = "(Optional, Forces new resource) The name of the DB subnet group. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = ""
}

variable "db_subnet_group_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix."
  type        = string
  default     = ""
}

variable "db_subnet_group_description" {
  description = "(Optional) The description of the DB subnet group."
  type        = string
  default     = "Managed by Terraform"
}

variable "db_subnet_group_subnet_ids" {
  description = "(Required) A list of VPC subnet IDs."
  type        = list(string)
  default     = []
}

variable "db_subnet_group_tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

####################################
# DB INSTANCE     
####################################
variable "instance_allocated_storage" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
  type        = number
  default     = 20
}

variable "instance_allow_major_version_upgrade" {
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "instance_apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. "
  type        = bool
  default     = false
}

variable "instance_auto_minor_version_upgrade" {
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  type        = bool
  default     = true
}

variable "instance_availability_zone" {
  description = "(Optional) The AZ for the RDS instance."
  type        = string
  default     = null
}

# Quel retention par défault ?
variable "instance_backup_retention_period" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. "
  type        = string
  default     = null
}

variable "instance_backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window."
  type        = string
  default     = null
}

variable "instance_ca_cert_identifier" {
  description = "(Optional) The identifier of the CA certificate for the DB instance."
  type        = string
  default     = null
}

variable "instance_character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed. "
  type        = string
  default     = null
}

variable "instance_copy_tags_to_snapshot" {
  description = "(Optional, boolean) Copy all Instance tags to snapshots. Default is false."
  type        = bool
  default     = null
}

variable "instance_db_subnet_group_name" {
  description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. See DBSubnetGroupName in API action CreateDBInstanceReadReplica for additional read replica contraints."
  type        = string
  default     = null
}

variable "instance_delete_automated_backups" {
  description = "(Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true."
  type        = bool
  default     = true
}

variable "instance_deletion_protection" {
  description = "(Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false."
  type        = bool
  default     = false
}

variable "instance_domain" {
  description = "(Optional) The ID of the Directory Service Active Directory domain to create the instance in."
  type        = string
  default     = null
}

variable "instance_domain_iam_role_name" {
  description = "(Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null
}

variable "instance_enabled_cloudwatch_logs_exports" {
  description = "(Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  type        = list(string)
  default     = null
}

variable "instance_engine" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance."
  type        = string
  default     = "mysql"
}

variable "instance_engine_version" {
  description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). "
  type        = string
  default     = "5.7"
}

variable "instance_final_snapshot_identifier" {
  description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica."
  type        = string
  default     = null
}

variable "instance_iam_database_authentication_enabled" {
  description = "(Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = false
}

variable "instance_identifier" {
  description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
  type        = string
  default     = "default"
}

variable "instance_identifier_prefix" {
  description = "(Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier."
  type        = string
  default     = null
}

variable "instance_instance_class" {
  description = "(Required) The instance type of the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "instance_iops" {
  description = "(Optional) The amount of provisioned IOPS. Setting this implies a storage_type of io1."
  type        = string
  default     = null
}

variable "instance_kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  type        = string
  default     = null
}

variable "instance_license_model" {
  description = "(Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance."
  type        = string
  default     = null
}

variable "instance_maintenance_window" {
  description = "(Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00."
  type        = string
  default     = null
}

variable "instance_max_allocated_storage" {
  description = "(Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  type        = string
  default     = null
}

variable "instance_monitoring_interval" {
  description = "(Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = string
  default     = null
}

variable "instance_monitoring_role_arn" {
  description = "(Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances."
  type        = string
  default     = null
}

variable "instance_multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = null
}

variable "instance_name" {
  description = "(Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines."
  type        = string
  default     = "default"
}

variable "instance_option_group_name" {
  description = "(Optional) Name of the DB option group to associate."
  type        = string
  default     = null
}

variable "instance_parameter_group_name" {
  description = "(Optional) Name of the DB parameter group to associate."
  type        = string
  default     = "default.mysql5.7"
}

variable "instance_password" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
  default     = "password"
}

variable "instance_performance_insights_enabled" {
  description = "(Optional) Specifies whether Performance Insights are enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "instance_performance_insights_kms_key_id" {
  description = "(Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed."
  type        = string
  default     = null
}

variable "instance_performance_insights_retention_period" {
  description = "(Optional) The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7'."
  type        = number
  default     = 7
}

variable "instance_port" {
  description = "(Optional) The port on which the DB accepts connections."
  type        = string
  default     = "3306"
}

variable "instance_publicly_accessible" {
  description = "(Optional) Bool to control if instance is publicly accessible. Default is false."
  type        = bool
  default     = false
}

variable "instance_replicate_source_db" {
  description = "(Optional) Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id. See DB Instance Replication and Working with PostgreSQL and MySQL Read Replicas for more information on using Replication."
  type        = string
  default     = null
}

variable "instance_security_group_names" {
  description = "(Optional/Deprecated) List of DB Security Groups to associate."
  type        = list(string)
  default     = null
}

variable "instance_skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  type        = bool
  default     = false
}

variable "instance_snapshot_identifier" {
  description = "(Optional) Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  type        = string
  default     = null
}

variable "instance_storage_encrypted" {
  description = "(Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
  type        = bool
  default     = false
}

variable "instance_storage_type" {
  description = "(Optional) One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not."
  type        = string
  default     = "gp2"
}

variable "instance_tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "instance_timezone" {
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  type        = string
  default     = null
}

variable "instance_username" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user."
  type        = string
  default     = "root"
}

variable "instance_vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate."
  type        = list(string)
  default     = null
}

variable "s3_import" {
    description = "(Optional) List of maps of s3 import"
    type = list(map(string))
    default = [{}]
}

variable "restore_to_point_in_time" {
    description = "(Optional) List of maps of s3 import"
    type = list(map(string))
    default = [{}]
}