# terraform-ingress-nginx

## HowTo

    module "ingress_nginx" {
      source               = "crazy-canux/nginx/ingress"
      version              = "0.1.0"
      namespace_name = local.namespace
      helm_values          = ["${file("${path.module}/helm-values.yaml")}"]
      depends_on = [data.terraform_remote_state.eks]
      extra_set_values = [
        {
          name = "serviceAccount.name"
          value = local.service_account
          type = "string"
        }
      ]
    }