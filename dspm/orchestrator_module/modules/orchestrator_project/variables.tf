variable "tenant_id" {
  type = string
}
variable "external_id" {
  type = string
}
variable "env_prefix" {
  type    = string
  default = ""
}
variable "readonly_sa_name_prefix" {
  type    = string
  default = "dig-readonly-"
}
variable "readonly_impersonator" {
  type    = string
  default = "dig-security@dig-security.iam.gserviceaccount.com"
}
variable "scanner_sa_name_prefix" {
  type    = string
  default = "dig-scanner-"
}
variable "scanner_impersonator" {
  type    = string
  default = ""
}
variable "orchestrator_sa_name_prefix" {
  type    = string
  default = "dig-orchestrator-"
}
variable "orchestrator_impersonator" {
  type    = string
  default = "dig-security@dig-security.iam.gserviceaccount.com"
}
variable "onboarding_notification_endpoint" {
  type    = string
  default = "https://onboarding.dig.security/gcp/notification"
}
variable "project_sink_name_prefix" {
  type    = string
  default = "dig-sink-"
}
variable "sink_destination_topic" {
  type    = string
  default = "prod-gcp-data-aggregator-messaging-customer-events"
}
variable "sink_destination_project_id" {
  type    = string
  default = "dig-security"
}
variable "project_role_scanner1" {
  type = map(any)
  default = {
    name  = "dig_security_scanner_resource_creator"
    title = "Dig Security Scanner Resource Creator"
  }
}
variable "project_role_scanner2" {
  type = map(any)
  default = {
    name  = "dig_security_scanner_storage"
    title = "Dig Security Scanner Storage"
  }
}
variable "project_role_scanner3" {
  type = map(any)
  default = {
    name  = "dig_security_scanner_keyops"
    title = "Dig Security Scanner KeyOps"
  }
}
variable "project_role_collector1" {
  type = map(any)
  default = {
    name  = "dig_security_collector"
    title = "Dig Security Collector"
  }
}
variable "project_role_readonly1" {
  type = map(any)
  default = {
    name  = "dig_security_readonly"
    title = "Dig Security Readonly"
  }
}
variable "project_role_orchestrator1" {
  type = map(any)
  default = {
    name  = "dig_security_orchestrator_resource_creator"
    title = "Dig Security Orchestrator Resource Creator"
  }
}
variable "project_role_orchestrator2" {
  type = map(any)
  default = {
    name  = "dig_security_orchestrator_resource_management"
    title = "Dig Security Orchestrator Resource Management"
  }
}
variable "project_role_orchestrator3" {
  type = map(any)
  default = {
    name  = "dig_security_orchestrator_cloudsql_ops"
    title = "Dig Security Orchestrator CloudSQL Ops"
  }
}
variable "project_role_orchestrator4" {
  type = map(any)
  default = {
    name  = "dig_security_orchestrator_key_management"
    title = "Dig Security Orchestrator Key Management"
  }
}
