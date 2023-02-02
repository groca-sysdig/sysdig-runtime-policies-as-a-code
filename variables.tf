variable "sysdig_api_token" {
  default = "7c09436b-a6f6-49dd-81cd-f83400326589"
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

