resource "sysdig_secure_policy" "workload-policy-gitops" {

  name = "workload-policy-gitops"
  description = "custom Falco managed policy for Workload"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  scope = "container.id != \"\""

  // Rule selection
  rule_names = ["gitops - Terminal shell in container"]

  actions {
#   container = "stop"
    capture {
      name = "gitops-security-capture"
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
