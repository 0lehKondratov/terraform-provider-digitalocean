terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
     # version = ">= 2.4.0"
    }
  }
}

provider "digitalocean" {
  # Provider is configured using environment variables:
  # DIGITALOCEAN_TOKEN, DIGITALOCEAN_ACCESS_TOKEN
    token = "dop_v1_fa120de139aa79be23ea7c7f5a7d652074929514e13da19f350d333b22b68376"
}

data "digitalocean_kubernetes_versions" "current" {
  version_prefix = var.cluster_version
}

resource "digitalocean_kubernetes_cluster" "primary" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = "1.26.3-do.0"
#  version = data.digitalocean_kubernetes_versions.current.latest_version

  node_pool {
    name       = "default"
    size       = var.worker_size
    node_count = var.worker_count
  }
}
