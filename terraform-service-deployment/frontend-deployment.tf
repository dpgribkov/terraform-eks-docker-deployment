resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"

    labels = {
      "io.kompose.service" = "frontend"
    }

    annotations = {
      "kompose.cmd" = "kompose --file docker-compose.yml convert"

      "kompose.service.type" = "LoadBalancer"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "io.kompose.service" = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "frontend"
        }

        annotations = {
          "kompose.cmd" = "kompose --file docker-compose.yml convert"

          "kompose.service.type" = "LoadBalancer"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "frontend"
          image = "gcr.io/google-samples/gb-frontend:v4"

          port {
            container_port = 80
          }

          env {
            name  = "GET_HOSTS_FROM"
            value = "dns"
          }
        }

        restart_policy = "Always"
      }
    }
  }
}

