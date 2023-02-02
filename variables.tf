variable "sysdig_api_token" {
  value = ${{ secrets.SYSDIG_API_TOKEN }}
}
variable "sysdig_saas_region" {
  default = "https://eu1.app.sysdig.com"
}
variable "enable_mail_notifications" {
    default = true
}

variable "mail_users" {
    type = list
    default = ["gonzalo.rocamador@sysdig.com","testuser@mail.com"]

}

