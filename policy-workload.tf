resource "sysdig_secure_policy" "workload-policy-gitops" {

  name = "workload-policy-gitops"
  description = "custom managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  scope = "container.id != \"\""

  // Rule selection
  rule_names = ["gitops - Terminal shell in container"]

  actions {
    container = "stop"
    capture {
      name = "gitops-security-capture"
      seconds_before_event = 5
      seconds_after_event = 10
    }
  }
## To be delated if not using notifications or to change value from the Terraform output
  notification_channels = [40379]

}
