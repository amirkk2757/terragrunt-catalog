variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.31"
}

variable "addons" {
  description = "EKS addons"
  type        = any
  default = {
    enable_aws_load_balancer_controller = true
    enable_metrics_server               = true
    enable_karpenter                    = true
    enable_cw_prometheus                = true
    enable_kyverno                      = true
    enable_kyverno_policy_reporter      = true
    enable_kyverno_policies             = true
  }
}

variable "kms_key_admin_roles" {
  description = "list of role ARNs to add to the KMS policy"
  type        = list(string)
  default     = []

}

variable "project_context_prefix" {
  description = "Prefix for project"
  type        = string
  default     = "eks-fleet-gitops"
}

variable "ssm_parameter_name_argocd_role_suffix" {
  description = "SSM parameter name for ArgoCD role"
  type        = string
  default     = "argocd-central-role"
}

variable "amazon_managed_prometheus_suffix" {
  description = "SSM parameter name for Amazon Manged Prometheus"
  type        = string
  default     = "amp-hub"
}

variable "ssm_parameter_name_backend_team_view_role_suffix" {
  description = "SSM parameter name for Fleet Workshop Team Backend IAM Role"
  type        = string
  default     = "backend-team-view-role"
}
variable "ssm_parameter_name_frontend_team_view_role_suffix" {
  description = "SSM parameter name for Fleet Workshop Team Backend IAM Role"
  type        = string
  default     = "frontend-team-view-role"
}

variable "enable_prometheus_scraper" {
  description = "Enable Prometheus Scraper"
  type        = bool
  default     = false
}

variable "cluster_name_prefix" {
  description = "Prefix for the EKS spoke cluster name (will be appended with workspace name)"
  type        = string
  default     = ""
}

variable "tenant_name" {
  description = "tenant name"
  type        = string
  default     = ""
}

variable "environment_name" {
  description = "Environment name like dev prod"
  type        = string
  default     = ""
}