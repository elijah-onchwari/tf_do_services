# Terraform Outputs

output "database_output" {
  description = "The full URI for connecting to the database cluster"
  value       = "MongoDB URI: ${nonsensitive(digitalocean_database_cluster.mongodb_cluster.uri)}"
}

output "user_local_public_IP" {
  description = "User's local public IP"
  value       = "User Local Public IP: ${data.external.myipaddr.result.ip}"
}