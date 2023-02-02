# Configure and authenticate to the Sysdig provider
provider "sysdig" {
  sysdig_secure_url = var.sysdig_saas_region
  sysdig_secure_api_token = ${{ secrets.SYSDIG_API_TOKEN }}
}

resource "sysdig_secure_notification_channel_email" "sample_email" {
    name                    = "Example Channel - Email"
    recipients              = var.mail_users
    enabled                 = var.enable_mail_notifications
    notify_when_ok          = false
    notify_when_resolved    = false
    send_test_notification  = false
}
