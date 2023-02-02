terraform {
  required_version = ">= 0.12"
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = ">=0.5"
    }
  }
}
