output "readonly_sa_email" {
  value = module.project_service_accounts.readonly_sa_email
}

output "scanner_sa_email" {
  value = module.project_service_accounts.scanner_sa_email
}

output "orchestrator_sa_email" {
  value = google_service_account.orchestrator.email
}
