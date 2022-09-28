resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = "terraform-do-cluster"
  region  = "nyc1"
  version = "1.24.4-do.0"

  tags = ["k8s"]

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb" # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 2
    tags       = ["k8s-default-node-pool"]
    labels = {
      "nealajpatel/project" = "k8s"
    }
  }
}