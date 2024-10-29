resource "google_service_account" "readonly" {
  account_id   = var.readonly_sa_name
  display_name = "Dig Security Read Only service account"
  description  = "Used by dig-security - ${local.version}"
}

resource "google_service_account_iam_member" "readonly_impersonator" {
  service_account_id = google_service_account.readonly.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:${var.readonly_impersonator}"
}

# adding the ability for the service accounts to assign themselves to VMs
resource "google_service_account_iam_member" "readonly_impersonator_self" {
  service_account_id = google_service_account.readonly.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.readonly.email}"
}

resource "google_service_account" "scanner" {
  account_id   = var.scanner_sa_name
  display_name = "Dig Security Scanner service account"
  description  = "Used by dig-security - ${local.version}"
}

resource "google_service_account_iam_member" "scanner_impersonator" {
  service_account_id = google_service_account.scanner.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:${var.scanner_impersonator}"
}

# adding the ability for the service accounts to assign themselves to VMs
resource "google_service_account_iam_member" "scanner_impersonator_self" {
  service_account_id = google_service_account.scanner.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.scanner.email}"
}
