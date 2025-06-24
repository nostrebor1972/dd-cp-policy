
# https://opensheet.elk.sh/1SJJHAiMTf4ms1OS5MNhCXd9SKnEuiDHRh9puamCih6M/networks

data "http" "networks" {
  url = "https://opensheet.elk.sh/1SJJHAiMTf4ms1OS5MNhCXd9SKnEuiDHRh9puamCih6M/networks"
}
locals {
  networks = jsondecode(data.http.networks.response_body)
}

resource "checkpoint_management_network" "networks" {

  # ignore_warnings = true

  for_each = { for network in local.networks : network.name => network }

  name         = each.value.name
  subnet4 = each.value.ip
  mask_length4  = each.value.mask

  color = each.value.color
  
  tags  =  ["terraform"]

  comments = lookup(each.value, "comment", null)
}
