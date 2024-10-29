variable "gcp_services" {
  type = list(string)
  default = [
    "deploymentmanager.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com",
    "orgpolicy.googleapis.com",
    "firestore.googleapis.com",
    "spanner.googleapis.com",
    "storagetransfer.googleapis.com",
    "servicenetworking.googleapis.com",
    "storage.googleapis.com",
    "sqladmin.googleapis.com",
    "bigquery.googleapis.com",
    "bigtable.googleapis.com",
    "bigtableadmin.googleapis.com",
    "bigtabletableadmin.googleapis.com",
    "memcache.googleapis.com",
    "redis.googleapis.com",
    "bigquerydatatransfer.googleapis.com",
    "secretmanager.googleapis.com",
    "dataflow.googleapis.com",
    "compute.googleapis.com"
  ]
}

variable "target_project_id" {
  type = string
}
