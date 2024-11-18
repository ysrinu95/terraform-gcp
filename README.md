# GCP Datastore Terraform Module

## Overview
This Terraform module provisions a GCP Datastore instance in Cloud Datastore Compatibility mode, with a specified Kind and optional indexes.

## Features
- Creates a Datastore instance in a specific GCP region.
- Configures indexes for the specified Kind.
- Outputs useful information about the provisioned resources.

## Inputs
| Variable          | Description                                | Type   | Default       | Required |
|-------------------|--------------------------------------------|--------|---------------|----------|
| `project_id`      | GCP Project ID                            | string |               | Yes      |
| `region`          | GCP Region for Datastore                  | string | `us-central`  | No       |
| `name`            | Name of the Datastore instance            | string |               | Yes      |
| `kind_name`       | Name of the Kind                          | string |               | Yes      |
| `index_properties`| Index properties (name, direction)        | map    | `{}`          | No       |

## Outputs
| Output                   | Description                                |
|--------------------------|--------------------------------------------|
| `datastore_instance_name`| The name of the created Datastore instance|
| `datastore_region`       | The region of the Datastore instance      |
| `datastore_kind_name`    | The name of the Kind created in Datastore |

## Usage
```hcl
module "datastore" {
  source = "./path-to-module"

  project_id       = "my-gcp-project"
  region           = "us-central"
  name             = "my-datastore"
  kind_name        = "my-kind"
  index_properties = {
    index1 = { name = "property1", direction = "ASCENDING" }
    index2 = { name = "property2", direction = "DESCENDING" }
  }
}
