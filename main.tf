locals {
  pgadmin4 = {
    fullnameOverride = "pgadmin4"
    tolerations      = var.tolerations
    nodeSelector     = var.nodeSelector
    image = {
      registry   = var.image_registry
      repository = var.image_repository
      tag        = var.image_tag

    }
    env = {
      email    = var.web_auth.email
      password = var.web_auth.password
    }
    persistentVolume = var.persistentVolume
    serverDefinitions = {
      enabled = true
      servers = var.servers_config
    }
  }
  VolumePermissions = {
    enabled = false
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
