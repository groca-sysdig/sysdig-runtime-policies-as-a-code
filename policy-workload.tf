resource "sysdig_secure_policy" "workload-policy-gitops" {

  name = "workload-policy-gitops"
  description = "custom managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  scope = "namespace.id = test"

  // Rule selection
  rule_names = ["Terminal shell in container"]

  actions {
    container = "stop"
    capture {
      seconds_before_event = 5
      seconds_after_event = 10
    }
  }

  notification_channels = [10000]

}
