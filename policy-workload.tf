resource "sysdig_secure_policy" "workload-policy-hasthitalk" {

  name = "[GRO]workload-policy-hashitalk"
  description = "custom Falco managed policy for Workload"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  scope = "kubernetes.namespace.name= \"shell-demo\""


  // Rule selection
  rule_names = ["gitops - Terminal shell in container","gitops - Connect EC2 Instance Metadata from container"]

  actions {
    capture {
      name = "hashitalk-security-capture"
      seconds_before_event = 5
      seconds_after_event = 10
    }
  }
  
  #  notification_channels = [10000]
## This is to be added if you want to create rules at the same tie as policies
    depends_on = [
      sysdig_secure_rule_falco.falco_example_rule
  ]
}
