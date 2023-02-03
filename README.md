# sysdig-runtime-policies-as-a-code
Manage Sysdig runtime policies on a GitOps fashion

## Table of contents
* [Overview](#overview)
* [What does it do?](#what-does-it-do?)
* [Setup](#setup)


## Overview
This is an example of how to manage Sysdig runtime policies with a GitOps approach by using GitHub to version and manage the security policies and rules, Terraform to define the rules and polices as a code and GitHub Actions to automatically apply new commited changes into the Sysdig Secure platform.


## What does it do?
The example configuration supports defining custom [Falco](https://falco.org) rules and runtime custom policies for any Workload, Kubernetes and AWS cloud trail by using the Sysdig Terraform provider. It also allows to create and mantain mail notifications and then configure it when an alert is triggered.

## Setup
It can be use in 2 different ways:

* As a [Standalone](#standalone-installation) way to deploy Sysdig runtime policies and rules leveraging Terraform provider
* Using Terraform with GitHub Actions to manage and mantain Sysdig runtime policies with [GitOps approach](#Gitops-approach)

### Standalone Installation
Blablabla

### GitOps installation with GitHub Actions and Terraform Cloud
blablabla




