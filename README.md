# sysdig-runtime-policies-as-a-code
Manage Sysdig runtime policies on a GitOps fashion
## Overview
This is an example of how to manage Sysdig runtime policies with a GitOps approach by using GitHub to version and manage the security policies and rules, Terraform to define the rules and polices as a code and GitHub Actions to automatically apply new commited changes into the Sysdig Secure platform.

## What does it do?
The example configuration supports building custom Falco rules and runtime custom policies for any Workload, Kubernetes and AWS cloud trail. It also allows to configure specific actions and notifications when the alert is triggered.
>What is [Falco](https://falco.org Falco Homepage")?
>What is a [Falco rule](https://falco.org/docs/rules/)?
>What is a Sysdig runtime custom policy?


