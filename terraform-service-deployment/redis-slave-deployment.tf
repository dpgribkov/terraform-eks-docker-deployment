resource "kubernetes_deployment" "redis_slave" {
  metadata {
    name = "redis-slave"

    labels = {
      "io.kompose.service" = "redis-slave"
    }

    annotations = {
      "kompose.cmd" = "kompose --file docker-compose.yml convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "io.kompose.service" = "redis-slave"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "redis-slave"
        }

        annotations = {
          "kompose.cmd" = "kompose --file docker-compose.yml convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "redis-slave"
          image = "gcr.io/google_samples/gb-redisslave:v3"

          port {
            container_port = 6379
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

