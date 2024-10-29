locals {
  version = "23"
  project_role_names = {
    scanner1 = {
      name  = var.project_role_scanner1["name"]
      title = var.project_role_scanner1["title"]
    }
    scanner2 = {
      name  = var.project_role_scanner2["name"]
      title = var.project_role_scanner2["title"]
    }
    scanner3 = {
      name  = var.project_role_scanner3["name"]
      title = var.project_role_scanner3["title"]
    }
    readonly1 = {
      name  = var.project_role_readonly1["name"]
      title = var.project_role_readonly1["title"]
    }
    collector1 = {
      name  = var.project_role_collector1["name"]
      title = var.project_role_collector1["title"]
    }
  }
}
