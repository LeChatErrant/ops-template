resource "digitalocean_project" "ops-template" {
  name        = "Ops template"
  description = "Infrastructure of the ops-template project"
  purpose     = "Web Application"
  resources = ["do:kubernetes:${digitalocean_kubernetes_cluster.cluster.id}"]
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
  }
}

resource "digitalocean_loadbalancer" "load-balancer" {
  name   = "load-balancer"
  region = "fra1"

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "tcp"
    target_port     = 30000
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 443
    entry_protocol  = "tcp"
    target_port     = 30443
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 30000
    protocol = "tcp"
  }
}

resource "digitalocean_domain" "domain" {
  name = "lechaterrant.com"
}

resource "digitalocean_record" "traefik" {
  domain = digitalocean_domain.domain.name
  name   = "traefik"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
}

resource "digitalocean_record" "argocd" {
  domain = digitalocean_domain.domain.name
  name   = "argocd"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
}
