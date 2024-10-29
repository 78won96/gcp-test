module "project_service_accounts" {
  depends_on = [
    google_service_account.orchestrator, google_service_account_iam_member.orchestrator_impersonator,
    google_service_account_iam_member.orchestrator_impersonator_self
  ]
  source                = "../project_service_accounts_monitored"
  readonly_sa_name      = var.readonly_sa_name
  readonly_impersonator = var.readonly_impersonator
  scanner_sa_name       = var.scanner_sa_name
  scanner_impersonator  = var.scanner_impersonator
  providers = {
    google = google
  }
}

resource "google_service_account" "orchestrator" {
  account_id   = var.orchestrator_sa_name
  display_name = "Dig Security Orchestrator service account"
  description  = "Used by dig-security - ${local.version}"
}

resource "google_service_account_iam_member" "orchestrator_impersonator" {
  service_account_id = google_service_account.orchestrator.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:${var.orchestrator_impersonator}"
}

# adding the ability for the service accounts to assign themselves to VMs
resource "google_service_account_iam_member" "orchestrator_impersonator_self" {
  service_account_id = google_service_account.orchestrator.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.orchestrator.email}"
}


