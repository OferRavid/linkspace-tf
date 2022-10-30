#create gitops argocd in cluster
resource "helm_release" "argo" {
  name             = "argocd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  namespace        = "argocd"
  version          = "5.8.7"
  create_namespace = true
  wait             = true
  reset_values     = true
  values = [file("${path.module}/values-argo.yaml")]
}