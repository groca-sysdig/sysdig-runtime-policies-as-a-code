## Falco workload Rule 1
resource "sysdig_secure_rule_falco" "falco_example_rule" {
  name        = "gitops - Terminal shell in container" // ID
  description = "A shell was used as the entrypoint/exec point into a container with an attached terminal."
  tags        = ["gitops", "container", "shell", "mitre_execution"]

  condition = "spawned_process and container and shell_procs and proc.tty != 0 and container_entrypoint"
  output    = "A shell was spawned in a container with an attached terminal (user=%user.name %container.info shell=%proc.name parent=%proc.pname cmdline=%proc.cmdline terminal=%proc.tty container_id=%container.id image=%container.image.repository)"
  priority  = "notice"
  source    = "syscall" // syscall or k8s_audit


  exceptions {
    name   = "proc_names"
    fields = ["proc.name"]
    comps  = ["in"]
    values = jsonencode([[["python", "python2", "python3"]]]) # If only one element is provided, it should still needs to be specified as a list of lists.
  }

  exceptions {
    name   = "container_proc_name"
    fields = ["container.id", "proc.name"]
    comps  = ["=", "in"]
    values = jsonencode([ # If more than one element is provided, you need to specify a list of lists.
      ["host", ["docker_binaries", "k8s_binaries", "lxd_binaries", "nsenter"]]
    ])
  }

  exceptions {
    name   = "proc_cmdline"
    fields = ["proc.name", "proc.cmdline"]
    comps  = ["in", "contains"]
    values = jsonencode([ # In this example, we are providing a pair of values for proc_cmdline, each one in a line.
      [["python", "python2", "python3"], "/opt/draios/bin/sdchecks"],
      [["java"], "sdjagent.jar"]
    ])
  }
}

## Falco workload Rule 2
resource "sysdig_secure_rule_falco" "falco_example_rule_2" {
  name        = "gitops - Connect EC2 Instance Metadata from container" // ID
  description = "Detect attempts to contact the EC2 Instance Metadata Service from a container"
  tags        = ["gitops", "aws", "mitre_exfiltration"]

  condition = "outbound and fd.sip=\"169.254.169.254\" and ec2_metadata_containers"
  output    = "Outbound connection to EC2 instance metadata service (proc.cmdline=%proc.cmdline connection=%fd.name %container.info evt.type=%evt.type evt.res=%evt.res proc.pid=%proc.pid proc.cwd=%proc.cwd proc.ppid=%proc.ppid proc.pcmdline=%proc.pcmdline proc.sid=%proc.sid proc.exepath=%proc.exepath user.uid=%user.uid user.loginuid=%user.loginuid user.loginname=%user.loginname user.name=%user.name group.gid=%group.gid group.name=%group.name container.id=%container.id container.name=%container.name image=%container.image.repository:%container.image.tag)"
  priority  = "notice"
  source    = "syscall" // syscall or k8s_audit

}
## Falco Cloudtrail Rule 
resource "sysdig_secure_rule_falco" "falco_cloudtrail_1" {
  name = "gitops - Attach an administrator policy to a user"
  description = " Detect attaching an administrator policy to a user."
  tags = ["aws", "gitops"]
  condition = "aws.eventName=\"AttachUserPolicy\" and not aws.errorCode exists and jevt.value[/requestParameters/policyArn]=\"arn:aws:iam::aws:policy/AdministratorAccess\""
  output    = "An administrator policy has been attached to an user (requesting user=%aws.user, requesting IP=%aws.sourceIP, AWS region=%aws.region,arn=%jevt.value[/userIdentity/arn], user attached to=%jevt.value[/requestParameters/userName])"
  priority  = "notice"
  source    = "aws_cloudtrail" // syscall or k8s_audit
}
## Sysdig Container Rule 
resource "sysdig_secure_rule_container" "sysdig_container" {
  name = "gitops - Nginx container spawned"
  description = "A container withthe nginx image spawned in the cluster."
  tags = ["gitops","container", "cis"]

  matching = true // default
  containers = ["gitops","nginx"]
}

## Sysdig network container rule

resource "sysdig_secure_rule_network" "sysdig_network_rule" {
  name = "gitops - Disallowed SSH Connection"
  description = "Detect any new ssh connection to a host other than those in an allowed group of hosts"
  tags = ["gitops","network", "mitre_remote_service"]

  block_inbound = true
  block_outbound = true

  tcp {
    matching = true // default
    ports = [22]
  }

  udp {
    matching = true // default
    ports = [22]
  }
}

