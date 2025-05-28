resource "checkpoint_management_package" "app" {
  name              = "AppPolicy"
  comments          = "designed to allow access to apps and inside apps"
  color             = "green"
  threat_prevention = false
  access            = true
}


resource "checkpoint_management_access_section" "misc" {

  name     = "misc"
  position = { top = "top" }
  layer    = "${checkpoint_management_package.app.name} Network"
}

resource "checkpoint_management_access_section" "app" {

  depends_on = [checkpoint_management_access_section.misc]

  for_each = local.apps

  name     = "App ${each.key}"
  position = { top = "top" }
  layer    = "${checkpoint_management_package.app.name} Network"
}