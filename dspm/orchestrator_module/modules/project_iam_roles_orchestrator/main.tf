resource "google_project_iam_custom_role" "roles" {
  for_each    = var.custom_roles["orchestrator_roles"]
  role_id     = lower(replace("${var.env_prefix}${local.project_role_names[each.key]["name"]}", "-", "_"))
  title       = local.project_role_names[each.key]["title"]
  description = "IAM role used by dig-security - ${local.version}"
  permissions = each.value["role_permissions"]
}

module "project_roles" {
  depends_on              = [google_project_iam_custom_role.roles]
  source                  = "../project_iam_roles_monitored"
  custom_roles            = var.custom_roles
  project_role_scanner1   = var.project_role_scanner1
  project_role_scanner2   = var.project_role_scanner2
  project_role_scanner3   = var.project_role_scanner3
  project_role_readonly1  = var.project_role_readonly1
  project_role_collector1 = var.project_role_collector1
  env_prefix              = var.env_prefix
  providers = {
    google = google
  }
}
