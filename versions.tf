terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = ">=0.5"
    }
  }
  cloud {
    organization = "grocamador"

    workspaces {
      name = "github-actions"
    }
  }
}
