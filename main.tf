resource "google_storage_bucket" "static_website" {
  name                        = "team9-static-bucket"
  location                    = "europe-west1"
  force_destroy               = true
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
  }

  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_iam_binding" "bucket_owner" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}



resource "google_storage_bucket_object" "index" {
  name         = "index.html"
  bucket       = google_storage_bucket.static_website.name
  content      = templatefile("${path.module}/webapp/index.html.tftpl", { api_url = google_cloud_run_service.api_service.status[0].url })
  content_type = "text/html"
}

data "google_project" "project" {
  project_id = "team9-446912"
}

resource "google_cloud_run_service" "api_service" {
  name     = "api-service"
  location = "europe-west1"

  template {
    spec {
      containers {
        image = "gcr.io/team9-446912/api-service-image:latest"  # Replace with actual image
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "run_access" {
  service  = google_cloud_run_service.api_service.name
  location = google_cloud_run_service.api_service.location
  role     = "roles/run.invoker"
  members = [
    "allUsers"  # Alternatively, specify service accounts or users
  ]
}

resource "google_project_iam_member" "grant_run_service_account_access" {
  project = "team9-446912"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:service-630768715557@serverless-robot-prod.iam.gserviceaccount.com"
}
