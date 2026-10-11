variable "dataproc_metastore_service_iam_members" {
  description = <<EOT
Map of dataproc_metastore_service_iam_members, attributes below
Required:
    - member
    - role
    - service_id
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member     = string
    role       = string
    service_id = string
    location   = optional(string)
    project    = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

