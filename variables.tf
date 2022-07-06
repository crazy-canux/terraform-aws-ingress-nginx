variable "chart_repo_url" {
  description = "URL to repository containing the ingress-nginx helm chart"
  type        = string
  default     = "https://kubernetes.github.io/ingress-nginx"
}

variable "namespace_name" {
  description = "Name for ingress-nginx namespace"
  type        = string
}

variable "helm_values" {
  description = "Values for ingress-nginx Helm chart in raw YAML. If none specified, module will add its own set of default values"
  type        = list(string)
  default     = []
}

variable "extra_set_values" {
  description = "Specific values to override in the ingress-nginx Helm chart (overrides corresponding values in the helm-value.yaml file within the module)"
  type = list(object({
    name  = string
    value = any
    type  = string
    })
  )
  default = []
}
