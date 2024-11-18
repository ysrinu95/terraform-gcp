output "datastore_database_name" {
  value = google_firestore_database.datastore_compat.name
}

output "datastore_database_location" {
  value = google_firestore_database.datastore_compat.location_id
}