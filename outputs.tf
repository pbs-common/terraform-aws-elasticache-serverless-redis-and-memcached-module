output "arn" {
  description = "The Amazon Resource Name of the serverless cache"
  value       = try(aws_elasticache_serverless_cache.this[0].arn, null)
}

output "endpoint" {
  description = "Represents the information required for client programs to connect to the cache node"
  value       = try(aws_elasticache_serverless_cache.this[0].endpoint, null)
}

output "full_engine_version" {
  description = "The name and version number of the engine the serverless cache is compatible with"
  value       = try(aws_elasticache_serverless_cache.this[0].full_engine_version, null)
}

output "reader_endpoint" {
  description = "Represents the information required for client programs to connect to the cache node (reader)"
  value       = try(aws_elasticache_serverless_cache.this[0].reader_endpoint, null)
}

output "name" {
  description = "The name of the serverless cache"
  value       = try(aws_elasticache_serverless_cache.this[0].name, null)
}

output "sg_ids" {
  description = "The security group IDs associated with the serverless cache"
  value       = local.security_group_ids
}

output "tags" {
  description = "The tags applied to the serverless cache"
  value       = local.tags
}
