resource "google_dataproc_metastore_service_iam_member" "dataproc_metastore_service_iam_members" {
  for_each = var.dataproc_metastore_service_iam_members

  member     = each.value.member
  role       = each.value.role
  service_id = each.value.service_id
  location   = each.value.location
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

