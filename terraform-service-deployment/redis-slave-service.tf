resource "kubernetes_service" "redis_slave" {
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
    port {
      name        = "6379"
      port        = 6379
      target_port = "6379"
    }

    selector = {
      "io.kompose.service" = "redis-slave"
    }
  }
}

