resource "google_project_service" "api" {
  for_each           = toset(var.gcp_services)
  project            = var.target_project_id
  service            = each.value
  disable_on_destroy = false
}
