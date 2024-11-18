module "datastore_test" {
  source = "../modules/datastore"

  project_id       = "test-gcp-project"
  region           = "us-central12"
  name             = "test-datastore"
  kind_name        = "test-kind"
}