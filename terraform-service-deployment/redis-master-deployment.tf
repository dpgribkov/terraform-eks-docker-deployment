resource "kubernetes_deployment" "redis_master" {
  metadata {
    name = "redis-master"

    labels = {
      "io.kompose.service" = "redis-master"
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
        "io.kompose.service" = "redis-master"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "redis-master"
        }

        annotations = {
          "kompose.cmd" = "kompose --file docker-compose.yml convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "redis-master"
          image = "k8s.gcr.io/redis:e2e"

          port {
            container_port = 6379
          }
        }

        restart_policy = "Always"
      }
    }
  }
}

