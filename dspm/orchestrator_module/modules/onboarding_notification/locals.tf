locals {
  version = "23"
  payload = {
    companyId                  = var.company_id
    projectId                  = var.target_project_id
    orchestrator               = var.is_orchestrator_project
    orchestratorProjectRef     = var.orchestrator_project_id
    version                    = local.version
    onboardingType             = var.onboarding_type
    roServiceAccountEmail      = var.readonly_sa_email
    orcServiceAccountEmail     = var.orchestrator_sa_email
    scannerServiceAccountEmail = var.scanner_sa_email
    sinkId                     = var.sink_id
  }
}
