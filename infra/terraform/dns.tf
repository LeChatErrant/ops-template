resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

resource "digitalocean_record" "root" {
  domain = digitalocean_domain.domain.name
  name   = "@"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}

resource "digitalocean_record" "traefik" {
  domain = digitalocean_domain.domain.name
  name   = "traefik"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}

resource "digitalocean_record" "argocd" {
  domain = digitalocean_domain.domain.name
  name   = "argocd"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}

resource "digitalocean_record" "api" {
  domain = digitalocean_domain.domain.name
  name   = "api"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}

resource "digitalocean_record" "studio" {
  domain = digitalocean_domain.domain.name
  name   = "studio"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}

resource "digitalocean_record" "kibana" {
  domain = digitalocean_domain.domain.name
  name   = "kibana"
  type   = "A"
  value  = digitalocean_loadbalancer.load-balancer.ip
  ttl    = 30
}
