##############################
# resource/module
##############################
resource "kubernetes_namespace" "ingress_nginx_namespace" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = var.chart_repo_url
  chart      = "ingress-nginx"
  namespace  = var.namespace_name

  values = length(var.helm_values) > 0 ? var.helm_values : ["${file("${path.module}/helm-values.yaml")}"]

  dynamic "set" {
    for_each = var.extra_set_values
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }

  depends_on = [
    kubernetes_namespace.ingress_nginx_namespace
  ]
}
