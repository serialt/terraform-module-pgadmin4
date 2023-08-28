locals {
  pgadmin4 = {
    fullnameOverride = "pgadmin4"
    tolerations      = var.tolerations
    nodeSelector     = var.nodeSelector
    env = {
      email    = var.web-auth.email
      password = var.web-auth.password
    }
    persistentVolume = {
      enabled = false
    }
    serverDefinitions = {
      enabled = true
      servers = var.servers_config
    }
  }
  VolumePermissions = {
    enabled = true
  }
  resources = var.resources


}

resource "helm_release" "pgadmin4" {
  name          = var.name
  namespace     = var.namespace
  chart         = var.chart_name
  version       = var.chart_version
  repository    = var.helm_repository
  recreate_pods = true

  values = [yamlencode(local.pgadmin4)]
}
