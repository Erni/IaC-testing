terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

locals {
  pod_labels = {
    app = var.name
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = var.name
  }

  spec {
    # As k8s is flexible we need to specify what to target
    # even if it´s defined in the same resource block
    selector {
      match_labels = local.pod_labels
    }

    replicas = var.replicas

    # Definition of the Pod Template (what containers to run, ports, env variable, etc)
    template {
      metadata {
        labels = local.pod_labels
      }

      spec {
        container {
          name  = var.name
          image = var.image
          port {
            container_port = var.container_port
          }

          dynamic "env" {
            for_each = var.environment_variables
            content {
              name  = env.key
              value = env.value
            }
          }
        }
      }
    }
  } 
}

resource "kubernetes_service" "app" {
  metadata {
    name = var.name
  }

  spec {
    # Depending on how k8s is configured, will deploy a different type of LB
    # e.g. AWS with EKS (Elastic Load Balancer), GCP with GKE (Cloud Load Balancer)
    type = "LoadBalancer"

    # Route traffic on port 80 to the port the container is listenning on
    port {
      port = 80
      target_port = var.container_port
      protocol = "TCP"
    }

    # The service and the deployment will both target the same Pods
    selector = local.pod_labels
  }
}