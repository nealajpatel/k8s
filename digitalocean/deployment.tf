resource "kubernetes_deployment" "golang" {
  metadata {
    name = "golang-app"
    labels = {
      test = "golang-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "golang-app"
      }
    }

    template {
      metadata {
        labels = {
          test = "golang-app"
        }
      }

      spec {
        container {
          image = "registry.digitalocean.com/nealajpatel/golang-app"
          name  = "example"

          resources {
            limits = {
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "50Mi"
            }
          }

          readiness_probe {
            http_get {
              path = "/health/ping"
              port = 8080
            }
            initial_delay_seconds = 3
            period_seconds        = 3
            failure_threshold     = 10
            timeout_seconds       = 5
          }

          liveness_probe {
            http_get {
              path = "/health/ping"
              port = 8080
            }

            initial_delay_seconds = 3
            period_seconds        = 3
            timeout_seconds       = 5
          }
        }
      }
    }
  }
}