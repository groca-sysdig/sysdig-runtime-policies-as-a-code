resource "sysdig_secure_policy" "aws-policy-gitops" {

  name = "aws-policy-gitops"
  type = "aws_cloudtrail"
  description = "Custom managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  // scope = "aws.accountId != \"\""

  // Rule selection
  rule_names = ["gitops - Attach an administrator policy to a user"]

  actions {
 
  }
#Needed if creating and assigning rules at the same time
    depends_on = [
      sysdig_secure_rule_falco.falco_cloudtrail_1
  
  ]
}
