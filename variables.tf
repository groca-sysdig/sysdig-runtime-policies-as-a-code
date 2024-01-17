variable "sysdig_api_token" {
  default = ""
}
variable "sysdig_saas_region" {
  default = "https://eu1.app.sysdig.com"
}
variable "enable_mail_notifications" {
    default = true
}

variable "mail_users" {
    type = list
    default = ["testuser@mail.com","hashitalk@mail.com"]

}

