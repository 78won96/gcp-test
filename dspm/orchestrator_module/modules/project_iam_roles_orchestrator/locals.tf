locals {
  version = "23"
  project_role_names = {
    orchestrator1 = {
      name  = var.project_role_orchestrator1["name"]
      title = var.project_role_orchestrator1["title"]
    }
    orchestrator2 = {
      name  = var.project_role_orchestrator2["name"]
      title = var.project_role_orchestrator2["title"]
    }
    orchestrator3 = {
      name  = var.project_role_orchestrator3["name"]
      title = var.project_role_orchestrator3["title"]
    }
    orchestrator4 = {
      name  = var.project_role_orchestrator4["name"]
      title = var.project_role_orchestrator4["title"]
    }
  }
}
