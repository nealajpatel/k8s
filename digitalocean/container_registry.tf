resource "digitalocean_container_registry" "golang_app_registry" {
  name                   = "nealajpatel"
  subscription_tier_slug = "starter"
}