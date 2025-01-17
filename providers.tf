provider "google" {
  project = "team9-446912"
  region  = "europe-west1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }  
  }
}