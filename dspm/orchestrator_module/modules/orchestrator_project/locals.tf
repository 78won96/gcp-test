locals {
  permissions   = jsondecode(file("${path.module}/../../permissions.json"))
  version       = "23"
  project_roles = {
    orchestrator1 = var.project_role_orchestrator1
    orchestrator2 = var.project_role_orchestrator2
    orchestrator3 = var.project_role_orchestrator3
    orchestrator4 = var.project_role_orchestrator4
    collector1    = var.project_role_collector1
    scanner1      = var.project_role_scanner1
    scanner2      = var.project_role_scanner2
    scanner3      = var.project_role_scanner3
    readonly1     = var.project_role_readonly1
  }
  project_sink_name    = "${var.project_sink_name_prefix}${var.external_id}"
  readonly_sa_name     = "${var.readonly_sa_name_prefix}${var.external_id}"
  scanner_sa_name      = "${var.scanner_sa_name_prefix}${var.external_id}"
  orchestrator_sa_name = "${var.orchestrator_sa_name_prefix}${var.external_id}"
  scanner_impersonator = var.scanner_impersonator == "" ? "${local.orchestrator_sa_name}@${data.google_client_config.this.project}.iam.gserviceaccount.com" : var.scanner_impersonator
}
