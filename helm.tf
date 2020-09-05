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

resource "helm_release" "cluster_autoscaler" {
  name  = "cluster-autoscaler"
  chart = "./eks-helm-charts/charts/cluster-autoscaler"
  namespace = "kube-system"
  verify = false

  set {
    name  = "autoDiscovery.clusterName"
    value = var.eks_cluster_name
  }
  set {
    name  = "cloudProvider"
    value = "aws"
  }
  set {
    name  = "awsRegion"
    value = "eu-central-1"
  }

}



resource "helm_release" "sumologic" {
  name       = "sumologic-monitoring"
  repository = "https://sumologic.github.io/sumologic-kubernetes-collection" 
  chart      = "sumologic"
  version    = var.chart_release_version
  create_namespace = true
  namespace  = "monitoring"
 
   set {
    name  = "sumologic.accessId"
    value = "suApTxwSVHkX6N"
  }
   set {
    name  = "sumologic.accessKey"
    value = "T5QlWNcGz7kjP7fYV4NrTnbrpsZYVh9Eh8vKb09T2DMvPH4nMLwa4s1D16JgcMBc"
  }
    set {
    name  = "sumologic.clusterName"
    value = var.eks_cluster_name
  }
}


