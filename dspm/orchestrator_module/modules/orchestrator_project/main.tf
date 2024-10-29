#-----------Project_APIs-----------#
module "gcp_services" {
  source            = "../project_cloud_services"
  target_project_id = data.google_client_config.this.project
  providers = {
    google = google.orchestrator
  }
}

provider "google" {
  project = data.google_client_config.this.project
  alias   = "orchestrator"
}

data "google_client_config" "this" {}

#-----------Project_sink-----------#
resource "google_logging_project_sink" "dig_sink" {
  depends_on             = [module.gcp_services]
  name                   = local.project_sink_name
  description            = "Used by dig-security (DDR) - ${local.version}"
  project                = data.google_client_config.this.project
  destination            = "pubsub.googleapis.com/projects/${var.sink_destination_project_id}/topics/${var.sink_destination_topic}"
  filter                 = "logName=projects/${data.google_client_config.this.project}/logs/cloudaudit.googleapis.com%2Factivity"
  unique_writer_identity = true
  lifecycle {
    ignore_changes = [filter]
  }
}
#-----------Dig_SAs-----------#
module "project_service_accounts" {
  depends_on                = [module.gcp_services, google_logging_project_sink.dig_sink]
  source                    = "../project_service_accounts_orchestrator"
  readonly_sa_name          = local.readonly_sa_name
  readonly_impersonator     = var.readonly_impersonator
  scanner_sa_name           = local.scanner_sa_name
  scanner_impersonator      = local.scanner_impersonator
  orchestrator_sa_name      = local.orchestrator_sa_name
  orchestrator_impersonator = var.orchestrator_impersonator
  providers = {
    google = google.orchestrator
  }
}
#-----------Dig_project_roles-----------#
module "project_roles" {
  depends_on                 = [module.gcp_services, module.project_service_accounts]
  source                     = "../project_iam_roles_orchestrator"
  custom_roles               = local.permissions
  project_role_orchestrator1 = local.project_roles["orchestrator1"]
  project_role_orchestrator2 = local.project_roles["orchestrator2"]
  project_role_orchestrator3 = local.project_roles["orchestrator3"]
  project_role_orchestrator4 = local.project_roles["orchestrator4"]
  project_role_collector1    = local.project_roles["collector1"]
  project_role_scanner1      = local.project_roles["scanner1"]
  project_role_scanner2      = local.project_roles["scanner2"]
  project_role_scanner3      = local.project_roles["scanner3"]
  project_role_readonly1     = local.project_roles["readonly1"]
  env_prefix                 = var.env_prefix
  providers = {
    google = google.orchestrator
  }
}

#-----------Project_IAM_binding-----------#
module "project_binding" {
  for_each = {
    orchestrator_sa_assignment_project_role_orchestrator1 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["orchestrator1"]["name"]}"
      assignment_condition = local.permissions["orchestrator_roles"]["orchestrator1"]["assignment_condition"]
      assignment_title     = local.permissions["orchestrator_roles"]["orchestrator1"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    orchestrator_sa_assignment_project_role_orchestrator2 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["orchestrator2"]["name"]}"
      assignment_condition = local.permissions["orchestrator_roles"]["orchestrator2"]["assignment_condition"]
      assignment_title     = local.permissions["orchestrator_roles"]["orchestrator2"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    orchestrator_sa_assignment_project_role_orchestrator3 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["orchestrator3"]["name"]}"
      assignment_condition = local.permissions["orchestrator_roles"]["orchestrator3"]["assignment_condition"]
      assignment_title     = local.permissions["orchestrator_roles"]["orchestrator3"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    orchestrator_sa_assignment_project_role_orchestrator4 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["orchestrator4"]["name"]}"
      assignment_condition = local.permissions["orchestrator_roles"]["orchestrator4"]["assignment_condition"]
      assignment_title     = local.permissions["orchestrator_roles"]["orchestrator4"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    orchestrator_sa_assignment_builtin_role_viewer = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "viewer"
      assignment_condition = ""
      assignment_title     = ""
      preconfigured_role   = true
      organization_role    = false
    }
    orchestrator_sa_assignment_internal_project_role_collector1 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["collector1"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["collector1"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["collector1"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    orchestrator_sa_assignment_internal_project_role_scanner2 = {
      sa_email             = module.project_service_accounts.orchestrator_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["scanner2"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["scanner2"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["scanner2"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    scanner_sa_assignment_builtin_role_logging_admin = {
      sa_email             = module.project_service_accounts.scanner_sa_email
      role_name            = "logging.admin"
      assignment_condition = "resource.name.startsWith(\"projects/${data.google_client_config.this.project}/sinks/${local.project_sink_name}\")"
      assignment_title     = "restrict_to_dig_project_sink"
      preconfigured_role   = true
      organization_role    = false
    }
    scanner_sa_assignment_internal_project_role_scanner1 = {
      sa_email             = module.project_service_accounts.scanner_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["scanner1"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["scanner1"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["scanner1"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    scanner_sa_assignment_internal_project_role_scanner2 = {
      sa_email             = module.project_service_accounts.scanner_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["scanner2"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["scanner2"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["scanner2"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    scanner_sa_assignment_internal_project_role_scanner3 = {
      sa_email             = module.project_service_accounts.scanner_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["scanner3"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["scanner3"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["scanner3"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    scanner_sa_assignment_builtin_role_viewer = {
      sa_email             = module.project_service_accounts.scanner_sa_email
      role_name            = "viewer"
      assignment_condition = ""
      assignment_title     = ""
      preconfigured_role   = true
      organization_role    = false
    }
    readonly_sa_assignment_internal_project_role_readonly1 = {
      sa_email             = module.project_service_accounts.readonly_sa_email
      role_name            = "${var.env_prefix}${local.project_roles["readonly1"]["name"]}"
      assignment_condition = local.permissions["monitored_roles"]["readonly1"]["assignment_condition"]
      assignment_title     = local.permissions["monitored_roles"]["readonly1"]["assignment_title"]
      preconfigured_role   = false
      organization_role    = false
    }
    readonly_sa_assignment_builtin_role_viewer = {
      sa_email             = module.project_service_accounts.readonly_sa_email
      role_name            = "viewer"
      assignment_condition = ""
      assignment_title     = ""
      preconfigured_role   = true
      organization_role    = false
    }
  }
  depends_on            = [module.project_service_accounts, module.project_roles]
  source                = "../project_iam_binding"
  target_project_id     = data.google_client_config.this.project
  assignment_attributes = each.value
  providers = {
    google = google.orchestrator
  }
}

#-----------Notify_onboarding_complete-----------#
module "notification" {
  depends_on              = [module.gcp_services, module.project_service_accounts, google_logging_project_sink.dig_sink, module.project_roles, module.project_binding]
  source                  = "../onboarding_notification"
  company_id              = var.tenant_id
  target_project_id       = data.google_client_config.this.project
  orchestrator_project_id = data.google_client_config.this.project
  is_orchestrator_project = true
  readonly_sa_email       = module.project_service_accounts.readonly_sa_email
  scanner_sa_email        = module.project_service_accounts.scanner_sa_email
  orchestrator_sa_email   = module.project_service_accounts.orchestrator_sa_email
  sink_id                 = google_logging_project_sink.dig_sink.id
  onboarding_type         = "TF_SINGLE"
  endpoint                = var.onboarding_notification_endpoint
}
