resource "sysdig_secure_policy" "container-policy-gitops" {
  name = "container-policy-gitops"
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
    capture {
      seconds_before_event = 5
      seconds_after_event = 10
    }
  }

#  notification_channels = [10000]

}
