variable "index_properties" {
  description = "List of index properties for Datastore"
  type        = list(object({
    name       = string
    properties = list(string)
  }))

  validation {
    condition     = length(var.index_properties) > 0
    error_message = "At least one index must be provided."
  }
}

variable "kind_name" {
  description = "Name of the Kind in the Datastore"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string

  validation {
    condition     = length(var.project_id) > 0
    error_message = "The project ID cannot be empty."
  }
}

variable "region" {
  description = "The GCP region where the Datastore will be created"
  type        = string

  validation {
    condition     = contains(["us-central1-a", "us-central1-b", "us-central1-c", "us-central1-f"], var.region)
    error_message = "The region must be one of: us-central1-a, us-central1-b, us-central1-c, us-central1-f."
  }
}

variable "datastore_name" {
  description = "Name of the datastore instance"
  type        = string

  validation {
    condition     = length(var.datastore_name) <= 30
    error_message = "The datastore name must not exceed 30 characters."
  }
}
