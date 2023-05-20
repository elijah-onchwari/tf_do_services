resource "digitalocean_project" "clearcrown" {
  name        = "Clear Crown"
  description = "Clear crown production resources."
  purpose     = "Web Application"
  environment = "Production"
}

resource "digitalocean_project_resources" "clearcrown_resources" {
  project = digitalocean_project.clearcrown.id
  resources = [
    digitalocean_app.web_app.urn
  ]
}