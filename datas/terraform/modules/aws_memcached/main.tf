####################################
# AWS ELB MODULE
# For more information go to : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster
# /!\ Don't change variable values in this file but directly on the bloc module of this Terraform module.
# Last modification date : 09/02/2021
####################################

####################################
# PARAMETER GROUP     
####################################
resource "aws_elasticache_parameter_group" "this" {
  name        = var.parameter_group_name        # Required
  family      = var.parameter_group_family      # Required
  description = var.parameter_group_description # Optional

  parameter {
    name  = "max_item_size"   # Required
    value = var.max_item_size # Required
  }
}

####################################
# CLUSTER     
####################################
resource "aws_elasticache_cluster" "this" {

  cluster_id         = var.cluster_id # Required
  engine             = var.engine     # Required
  engine_version     = var.engine_version
  maintenance_window = var.maintenance_window

  replication_group_id = var.replication_group_id

  node_type       = var.node_type       # Required
  num_cache_nodes = var.num_cache_nodes # Required

  parameter_group_name = aws_elasticache_parameter_group.this.name # Required

  port = var.port

  security_group_names = var.security_group_names
  security_group_ids   = var.security_group_ids

  apply_immediately = var.apply_immediately

  snapshot_arns            = var.snapshot_arns
  snapshot_name            = var.snapshot_name
  snapshot_window          = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit

  notification_topic_arn       = var.notification_topic_arn
  az_mode                      = var.az_mode
  availability_zone            = var.availability_zone
  preferred_availability_zones = var.preferred_availability_zones
  final_snapshot_identifier    = var.final_snapshot_identifier
  tags                         = var.cluster_tags
}

####################################
# SUBNET GROUP     
####################################
resource "aws_elasticache_subnet_group" "this" {
  name        = var.ecache_subnet_group_name
  description = var.ecache_subnet_group_description
  subnet_ids  = var.ecache_subnet_group_subnet_ids
}
