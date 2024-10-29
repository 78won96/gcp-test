output "readonly_sa_email" {
  value = google_service_account.readonly.email
}

output "scanner_sa_email" {
  value = google_service_account.scanner.email
}
