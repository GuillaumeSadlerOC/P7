####################################
# PARAMETER GROUP     
####################################
output "parameter_group_id" {
  description = "The ElastiCache parameter group name."
  value       = aws_elasticache_parameter_group.this.id
}

####################################
# CLUSTER     
####################################
output "cluster_arn" {
  description = "The ARN of the created ElastiCache Cluster."
  value       = aws_elasticache_cluster.this.arn
}

output "cluster_cache_nodes" {
  description = "List of node objects including id, address, port and availability_zone."
  value       = aws_elasticache_cluster.this.cache_nodes
}

output "cluster_configuration_endpoint" {
  description = "(Memcached only) The configuration endpoint to allow host discovery."
  value       = aws_elasticache_cluster.this.configuration_endpoint
}

output "cluster_cluster_address" {
  description = "(Memcached only) The DNS name of the cache cluster without the port appended."
  value       = aws_elasticache_cluster.this.cluster_address
}
