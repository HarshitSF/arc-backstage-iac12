region = "ap-southeast-1"
project_name = "arc-platform"
environment = "poc"

kubernetes_version = 1.32
map_additional_iam_users = [
    {
      username = "admin",
      groups   = ["system:masters"],
      userarn  = "arn:aws:iam::471112653618:user/harshit.kumar"
    }
  ]
instance_types = ["t3.small"]
kubernetes_labels = {}
desired_size = 2
max_size = 2
min_size = 1
addons = [
  // https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html#vpc-cni-latest-available-version
  {
    addon_name                  = "vpc-cni"
    addon_version               = null
    resolve_conflicts_on_create = "NONE"
    resolve_conflicts_on_update = "NONE"
    service_account_role_arn    = null
  },
  // https://docs.aws.amazon.com/eks/latest/userguide/managing-kube-proxy.html
  {
    addon_name                  = "kube-proxy"
    addon_version               = null
    resolve_conflicts_on_create = "NONE"
    resolve_conflicts_on_update = "NONE"
    service_account_role_arn    = null
  }
]
kubernetes_namespace = "arc-platform"
capacity_type = "SPOT"
create_node_group = true

##################################################################################
#ADD-ON VARIABLES
##################################################################################
eks_addons_timeouts                          = {}
enable_aws_load_balancer_controller          = true
enable_cluster_proportional_autoscaler       = false
enable_karpenter                             = false
enable_kube_prometheus_stack                 = false
enable_metrics_server                        = true
enable_external_dns                          = false
external_dns_route53_zone_arns               = []
enable_argocd                                = true
enable_argo_rollouts                         = false
enable_argo_workflows                        = true
enable_cluster_autoscaler                    = true
enable_aws_cloudwatch_metrics                = false
external_secrets_ssm_parameter_arns          = []
external_secrets_secrets_manager_arns        = []
enable_ingress_nginx                         = false
enable_aws_privateca_issuer                  = false
enable_velero                                = false
enable_aws_for_fluentbit                     = true
enable_external_secrets                      = false
enable_aws_node_termination_handler          = false
enable_cert_manager                          = false
enable_aws_efs_csi_driver                    = false
enable_aws_fsx_csi_driver                    = false
enable_secrets_store_csi_driver              = true
enable_secrets_store_csi_driver_provider_aws = true
enable_fargate_fluentbit                     = false
external_secrets_kms_key_arns                = []
enable_gatekeeper                            = false
enable_vpa                                   = false