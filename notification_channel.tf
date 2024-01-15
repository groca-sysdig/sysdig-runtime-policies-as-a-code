resource "sysdig_secure_notification_channel_email" "sample_email" {
    name                    = "[GRO]example channel - email"
    recipients              = var.mail_users
    enabled                 = var.enable_mail_notifications
    notify_when_ok          = false
    notify_when_resolved    = false
    send_test_notification  = false
}
