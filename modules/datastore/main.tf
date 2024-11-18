provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable Cloud Datastore API
resource "google_project_service" "datastore_api" {
  project = var.project_id
  service = "datastore.googleapis.com"

  disable_on_destroy = false
}

resource "google_firestore_database" "datastore_compat" {
  name           = var.datastore_name
  location_id    = var.region
  type           = "DATASTORE_MODE"
}

# Create Kind Indexes
resource "google_datastore_index" "datastore_indexes" {
  for_each = var.index_properties

  project = var.project_id
  kind    = var.kind_name

  properties {
    name      = each.value.name
    direction = each.value.direction
  }
}
