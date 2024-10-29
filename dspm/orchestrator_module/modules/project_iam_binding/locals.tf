locals {
  custom_role_identifier_prefix = tobool(var.assignment_attributes["organization_role"]) ? "organizations/${var.assignment_attributes["organization_id"]}/roles" : "projects/${var.target_project_id}/roles"
  role_identifier               = tobool(var.assignment_attributes["preconfigured_role"]) ? "roles/${replace(var.assignment_attributes["role_name"], "-", "_")}" : "${local.custom_role_identifier_prefix}/${replace(var.assignment_attributes["role_name"], "-", "_")}"
  assignment_condition          = var.assignment_attributes["assignment_condition"]
  sa_email                      = var.assignment_attributes["sa_email"]
  assignment_title              = var.assignment_attributes["assignment_title"]
}
