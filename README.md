# sysdig-runtime-policies-as-a-code
Manage runtime policies on a gitops fashion
## Overview
This is an example of how to manage Sysdig runtime policies with a GitOps approach by using GitHub to version and manage the security policies and rules, Terraform as an to define the rules and polices as a code and GitHub actions to automatically apply new commited changes into the Sysdig Secure platform.

## What does it do?
The example configuration supports building custom Falco rules and custom policies (group of rules that apply to a scope) for any Workload and Kubernetes. It also allows to configure specific actions and notifications when the alert is triggered.

