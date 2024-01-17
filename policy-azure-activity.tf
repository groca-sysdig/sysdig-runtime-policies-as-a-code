resource "sysdig_secure_policy" "azure-policy-hashitalk" {

  name = "[HASHITALK]azure-runtime-policy"
  type = "azure_platformlogs"
  description = "Custom managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  // scope = ""

  // Rule selection
  rule_names = ["gitops - Azure Deactivate MFA for User Access"]

  actions {
 
  }
#Needed if creating and assigning rules at the same time
    depends_on = [
      sysdig_secure_rule_falco.falco_azure_1
  
  ]
}
