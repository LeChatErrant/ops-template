resource "digitalocean_project" "ops-template" {
  name        = "Ops template"
  description = "Infrastructure of the ops-template project"
  purpose     = "Web Application"
}
