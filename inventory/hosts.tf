
locals {
  hosts_file = yamldecode(file("${path.module}/data/hosts.yaml"))
  hosts      = { for host in local.hosts_file.hosts : host.name => host }
}

# output "hosts" {
#   value = local.hosts
# }



resource "checkpoint_management_host" "hosts" {
  for_each = local.hosts

  name         = each.value.name
  ipv4_address = each.value.ip

  color = each.value.color
  tags  = concat(each.value.tags, ["terraform", "MadeByTF"])

  comments = lookup(each.value, "comment", null)
}