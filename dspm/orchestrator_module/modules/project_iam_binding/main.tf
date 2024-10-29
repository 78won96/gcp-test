resource "google_project_iam_member" "with_condition" {
  count   = local.assignment_condition != "" ? 1 : 0
  project = var.target_project_id
  role    = local.role_identifier
  member  = "serviceAccount:${local.sa_email}"
  condition {
    title       = local.assignment_title
    description = local.assignment_title
    expression  = local.assignment_condition
  }
}

resource "google_project_iam_member" "without_condition" {
  count   = local.assignment_condition == "" ? 1 : 0
  project = var.target_project_id
  role    = local.role_identifier
  member  = "serviceAccount:${local.sa_email}"
}


