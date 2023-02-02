output "notification_id" {
    description = "notification id created on GitOps"
    value = sysdig_secure_notification_channel_email.sample_email.id
}