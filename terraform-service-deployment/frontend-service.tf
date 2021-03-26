resource "kubernetes_service" "frontend" {
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
    port {
      name        = "80"
      port        = 80
      target_port = "80"
    }

    selector = {
      "io.kompose.service" = "frontend"
    }

    type = "LoadBalancer"
  }
}

