resource "digitalocean_app" "web_app" {
  spec {
    name    = "clearcrown-app"
    region  = "blr"

    alert {
      disabled = false
      rule     = "DEPLOYMENT_FAILED"
    }
    alert {
      disabled = false
      rule     = "DEPLOYMENT_LIVE"
    }
    alert {
      disabled = false
      rule     = "DOMAIN_FAILED"
    }
    alert {
      disabled = false
      rule     = "DOMAIN_LIVE"
    }

    service {
      build_command      = <<-EOT
                composer install
                npm run build
            EOT
      environment_slug   = "php"
      http_port          = 8080
      instance_count     = 2
      instance_size_slug = "professional-xs"
      internal_ports     = []
      name               = "clearcrown"
      run_command        = <<-EOT
                php artisan migrate --force
                heroku-php-apache2 public/
            EOT
      source_dir         = "/"

      env {
        key   = "APP_ENV"
        scope = "RUN_AND_BUILD_TIME"
        value = "production"
      }
      env {
        key   = "APP_KEY"
        scope = "RUN_AND_BUILD_TIME"
        value = "base64:lptQYgMOFulOO2xxKHDTySU5EoS+U1Iwk4XUVvfnrIQ="
      }
      env {
        key   = "APP_URL"
        scope = "RUN_AND_BUILD_TIME"
        value = "$${APP_URL}"
      }
      env {
        key   = "DB_CONNECTION"
        scope = "RUN_AND_BUILD_TIME"
        value = "mongodb"
      }
      env {
        key   = "DB_DATABASE"
        scope = "RUN_AND_BUILD_TIME"
        value = "admin"
      }
      env {
        key   = "DB_DSN"
        scope = "RUN_AND_BUILD_TIME"
        value = digitalocean_database_cluster.mongodb_cluster.uri
      }

      github {
        branch         = "main"
        deploy_on_push = true
        repo           = "elijah-onchwari/clearcrown"
      }

      log_destination {
        name = "logs"

        logtail {
          token = "1bFCs7PQxJ2dPs6CktHP97HR"
        }
      }
    }
  }
}