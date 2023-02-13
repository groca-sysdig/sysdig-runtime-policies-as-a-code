terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = ">=0.5.47"
    }
  }
  cloud {
    organization = "grocamador"

    workspaces {
      name = "github-actions"
    }
  }
}
