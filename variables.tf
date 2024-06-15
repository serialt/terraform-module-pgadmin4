variable "helm_repository" {
  type    = string
  default = "https://helm.runix.net"
}

variable "chart_version" {
  type    = string
  default = "1.24.0"
}

variable "chart_name" {
  type    = string
  default = "pgadmin4"

}

variable "image_registry" {
  type    = string
  default = "docker.io"
}

variable "image_repository" {
  type    = string
  default = "dpage/pgadmin4"

}
variable "image_tag" {
  type    = string
  default = ""

}
variable "app_version" {
  type    = string
  default = ""
}

variable "name" {
  type    = string
  default = "pgadmin4"
}

variable "namespace" {
  type    = string
  default = ""
}



variable "resources" {
  type    = any
  default = {}
}


variable "web_auth" {
  type = any
  default = {
    email    = ""
    password = ""
  }

}


variable "servers_config" {
  type    = any
  default = {}
}


variable "nodeSelector" {
  type    = any
  default = {}

}

variable "tolerations" {
  type    = list(any)
  default = []

}

variable "persistentVolume" {
  type = any
  default = {
    default = false
  }
}
