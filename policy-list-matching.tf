resource "sysdig_secure_policy" "container-policy-gitops" {
  name = "list-matching-policy-gitops"
  type = "list_matching"
  description = "Custom container managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  scope = "container.id != \"\""

  // Rule selection
  rule_names = ["gitops - Nginx container spawned","gitops - Disallowed SSH Connection"]

  actions {
    container = "stop"
  }
  #Important to add if you want also rules created at the same time 
    depends_on = [
      sysdig_secure_rule_container.sysdig_container,
      sysdig_secure_rule_network.sysdig_network_rule
  
  ]
#  notification_channels = [10000]

}
