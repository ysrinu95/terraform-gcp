module "datastore_test" {
  source = "../modules/datastore"

  project_id       = "test-gcp-project"
  region           = "us-central1"
  name             = "test-datastore"
  kind_name        = "test-kind"
  index_properties = {
    index1 = { name = "property1", direction = "ASCENDING" }
  }
}

output "datastore_database_name" {
  value = module.datastore_test.datastore_database_name
}

output "datastore_database_location" {
  value = module.datastore_test.datastore_database_location
}