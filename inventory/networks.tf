
# https://opensheet.elk.sh/1AxnotD9U9kKOluFNRFPQoddXRg4ffVHaamdDIj31UhM/networks

data "http" "networks" {
  url = "https://opensheet.elk.sh/1AxnotD9U9kKOluFNRFPQoddXRg4ffVHaamdDIj31UhM/networks"
}
locals {
  networks = jsondecode(data.http.networks.body)
}

resource "checkpoint_management_network" "networks" {
  for_each = { for network in local.networks : network.name => network }

  name         = each.value.name
  subnet4 = each.value.ip
  mask_length4  = each.value.mask

  color = each.value.color
  
  tags  =  ["terraform"]

  comments = lookup(each.value, "comment", null)
}