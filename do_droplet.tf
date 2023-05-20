resource "digitalocean_droplet" "rabbitmq_server" {
  image  = "ubuntu-22-04-x64"
  name   = "rabbitmq_server_prod"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}