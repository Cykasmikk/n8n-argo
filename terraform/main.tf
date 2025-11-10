resource "helm_release" "cnpg" {
  name       = "cloudnative-pg"
  repository = "https://cloudnative-pg.github.io/charts"
  chart      = "cloudnative-pg"
  version    = "0.20.1"
  namespace  = "cnpg-system"
  create_namespace = true
}

resource "helm_release" "external_secrets" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = "0.9.16"
  namespace  = "external-secrets"
  create_namespace = true
}

resource "helm_release" "argo_cd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6"
  namespace  = "argocd"
  create_namespace = true
  set {
    name  = "configs.params.server.insecure"
    value = true
  }
}
