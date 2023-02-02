# Configure and authenticate to the Sysdig provider
provider "sysdig" {
  sysdig_secure_url = var.sysdig_saas_region
  sysdig_secure_api_token = var.sysdig_api_token
}
