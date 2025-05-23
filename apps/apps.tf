
locals {
  apps_file = yamldecode(file("${path.module}/data/apps.yaml"))
  apps      = { for app in local.apps_file.apps : app.name => app }
}

output "apps" {
  value = local.apps
}