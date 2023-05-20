# digitalocean_database_cluster.mycluster:
resource "digitalocean_database_cluster" "mongodb_cluster" {
  name       = "db-mongodb-blr1-prod"
  engine     = "mongodb"
  node_count = 3
  project_id = digitalocean_project.clearcrown.id
  region     = "blr1"
  size       = "db-s-1vcpu-1gb"
  version    = "6"
}

resource "digitalocean_database_firewall" "mongodb_firewall" {
  cluster_id = digitalocean_database_cluster.mongodb_cluster.id

  rule {
    type  = "app"
    value = digitalocean_app.web_app.id
  }
}