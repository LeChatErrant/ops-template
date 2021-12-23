resource "digitalocean_project" "ops-template" {
  name        = "Ops template"
  description = "Infrastructure of the ops-template project"
  purpose     = "Web Application"
  resources = [
    "do:kubernetes:${digitalocean_kubernetes_cluster.cluster.id}",
    digitalocean_loadbalancer.load-balancer.urn,
    digitalocean_domain.domain.urn,
  ]
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "cluster"
  region  = "fra1"
  version = "1.21.5-do.0"

  node_pool {
    name       = "autoscaled-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 5
    tags = ["ops-template-droplet"]
  }
}

resource "digitalocean_loadbalancer" "load-balancer" {
  name   = "load-balancer"
  region = "fra1"
  droplet_tag = "ops-template-droplet"

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "tcp"
    target_port     = 30080
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 443
    entry_protocol  = "tcp"
    target_port     = 30443
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 30080
    protocol = "tcp"
  }
}
