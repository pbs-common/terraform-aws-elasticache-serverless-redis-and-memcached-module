output "name" {
  description = "The name of the serverless cache"
  value       = module.serverless_cache.name
}

output "arn" {
  description = "The ARN of the serverless cache"
  value       = module.serverless_cache.arn
}

output "sg_ids" {
  description = "The security group IDs associated with the serverless cache"
  value       = module.serverless_cache.sg_ids
}

output "endpoint" {
  description = "The endpoint of the serverless cache"
  value       = module.serverless_cache.endpoint
}

output "reader_endpoint" {
  description = "The reader endpoint of the serverless cache"
  value       = module.serverless_cache.reader_endpoint
}

output "full_engine_version" {
  description = "The full engine version of the serverless cache"
  value       = module.serverless_cache.full_engine_version
}
