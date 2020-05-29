#################################
## GCP Project Module - Output ##
#################################

output "project_id" {
  description = "Project id."
  value       = google_project.project.project_id
  depends_on = [
    google_project_organization_policy.boolean,
    google_project_organization_policy.list,
    google_project_service.project_services
  ]
}

output "name" {
  description = "Project ame."
  value       = google_project.project.name
  depends_on = [
    google_project_organization_policy.boolean,
    google_project_organization_policy.list,
    google_project_service.project_services
  ]
}

output "number" {
  description = "Project number."
  value       = google_project.project.number
  depends_on = [
    google_project_organization_policy.boolean,
    google_project_organization_policy.list,
    google_project_service.project_services
  ]
}

output "cloudsvc_service_account" {
  description = "Cloud services service account."
  value       = "${local.cloudsvc_service_account}"
  depends_on  = [google_project_service.project_services]
}

output "gce_service_account" {
  description = "Default GCE service account."
  value       = local.gce_service_account
  depends_on  = [google_project_service.project_services]
}

output "gcr_service_account" {
  description = "Default GCR service account."
  value       = local.gcr_service_account
  depends_on  = [google_project_service.project_services]
}

output "gke_service_account" {
  description = "Default GKE service account."
  value       = local.gke_service_account
  depends_on  = [google_project_service.project_services]
}

output "custom_roles" {
  description = "Ids of the created custom roles."
  value       = [for role in google_project_iam_custom_role.roles : role.role_id]
}
