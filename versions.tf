terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = ">=1.0"
    }
  }
  cloud {
    organization = "grocamador"

    workspaces {
      name = "github-actions"
    }
  }
}
