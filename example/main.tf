terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.0.19"
    }
  }
}

provider "kind" {
}

resource "kind_cluster" "default" {
  name = "new-cluster"
  wait_for_ready = true
  # WARNING: The argument `kubeconfig_path` has been removed. Use `kind_config_path` instead.
  # kind_config_path = "/path/to/your/kind-config.yaml"
  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }
  }
}

