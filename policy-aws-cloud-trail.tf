resource "sysdig_secure_policy" "aws-policy-gitops" {

  name = "aws-policy-gitops"
  type = "aws_cloudtrail"
  description = "custom managed policy operated with GitOps approach: GitHub actions + TF"
  severity = 4
  enabled = true
  runbook = "https://runbook.com"

  // Scope selection
  // scope = "aws.accountId != \"\""

  // Rule selection
  rule_names = ["Add AWS User to Group"]

  actions {
 
  }
## To be delated if not using notifications or to change value from the Terraform output

}
