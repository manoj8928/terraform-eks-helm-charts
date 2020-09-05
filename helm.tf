resource "helm_release" "metric-server" {
  name       = "metric-server-release"
  repository = "https://charts.bitnami.com/bitnami" 
  chart      = "metrics-server"
  namespace = "kube-system"

  set {
    name  = "apiService.create"
    value = "true"
  }

}
