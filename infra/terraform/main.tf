resource "digitalocean_project" "ops-template" {
  name        = "Ops template"
  description = "Infrastructure of the ops-template project"
  purpose     = "Web Application"
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "K8S cluster"
  region  = "fra1"
  version = "1.21.5-do.0"

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 5
  }
}