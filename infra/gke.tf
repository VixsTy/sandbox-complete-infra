resource "google_container_cluster" "primary" {
  provider = google-beta

  name     = "sandbox-${terraform.workspace}-cluster"
  location = var.google_zone
  project  = var.google_project

  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
    istio_config {
      disabled = false
    }

    dns_cache_config {
      enabled = true
    }
  }

  cluster_autoscaling {
    enabled             = false
    autoscaling_profile = "OPTIMIZE_UTILIZATION"
  }

  release_channel {
    channel = "RAPID"
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  workload_identity_config {
    workload_pool = "${var.google_project}.svc.id.goog"
  }

  # private_cluster_config {
  #   enable_private_nodes    = true
  #   enable_private_endpoint = false
  # }

  enable_shielded_nodes       = true
  enable_intranode_visibility = false
  pod_security_policy_config {
    enabled = false
  }

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  provider = google-beta

  name               = "sandbox-${terraform.workspace}-pool"
  location           = var.google_zone
  project            = var.google_project
  cluster            = google_container_cluster.primary.name
  initial_node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    preemptible  = true
    spot         = true
    machine_type = "e2-standard-2"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
