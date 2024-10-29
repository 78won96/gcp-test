resource "google_project_iam_custom_role" "roles" {
  for_each    = var.custom_roles["monitored_roles"]
  role_id     = lower(replace("${var.env_prefix}${local.project_role_names[each.key]["name"]}", "-", "_"))
  title       = local.project_role_names[each.key]["title"]
  description = "IAM role used by dig-security - ${local.version}"
  permissions = each.value["role_permissions"]
}
