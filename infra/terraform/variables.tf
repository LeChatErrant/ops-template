variable "do_token" {
  type = string
  description = "Digital Ocean token. Refer to https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/"
}

variable "domain_name" {
  type = string
  description = "Domain name (for example, example.com). Subdomains will be created for each apps (api.example.com, traefik.example.com, etc)"
}
