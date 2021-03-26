resource "kubernetes_service" "redis_master" {
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
    port {
      name        = "6379"
      port        = 6379
      target_port = "6379"
    }

    selector = {
      "io.kompose.service" = "redis-master"
    }
  }
}

