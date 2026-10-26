terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.6"
    }
  }
}

resource "kind_cluster" "devops_lab" {
  name            = var.cluster_name
  wait_for_ready  = true
  node_image      = "kindest/node:v1.32.0"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      extra_port_mappings {
        container_port = 30080
        host_port      = 30080
        protocol       = "TCP"
      }
    }
  }
}

output "kubeconfig_path" {
  value       = kind_cluster.devops_lab.kubeconfig_path
  description = "Path to kubeconfig for the kind cluster"
}

output "cluster_endpoint" {
  value = kind_cluster.devops_lab.endpoint
}
