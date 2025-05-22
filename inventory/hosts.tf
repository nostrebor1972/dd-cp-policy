
locals {
    hosts_file = yamldecode(file("${path.module}/data/hosts.yaml"))
    hosts = { for host in local.hosts_file.hosts : host.name => host }
}

output "hosts" {
    value = local.hosts
}

