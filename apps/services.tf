
locals {
    # look at apps.yaml and make list of services flat while adding attribute app with app.name 
    services = flatten([
        for app in local.apps_file.apps : [
            for service in app.services : merge(service, { app : app.name })
        ]
    ])
}

# output "services" {
#     value = local.services
# }

resource "checkpoint_management_access_rule" "svc_access" {

  for_each = { for svc in local.services : "${svc.name}@${svc.app}" => svc }

  layer    = "${checkpoint_management_package.app.name} Network"
  position = { below = checkpoint_management_access_section.app[each.value.app].id }

  name = "access to service ${each.value.name} in app ${each.value.app}"

  source = each.value.consumers

  enabled = true

  destination        = each.value.scope
  destination_negate = false

  service        = each.value.services
  service_negate = false

  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }

  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}