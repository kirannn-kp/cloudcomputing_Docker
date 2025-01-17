output "website_url" {
  value = "http://${google_storage_bucket.static_website.name}.storage.googleapis.com/index.html"
}

output "api_url" {
  value = google_cloud_run_service.api_service.status[0].url
  depends_on = [
    google_cloud_run_service.api_service
  ]
}

output "api_url_debug" {
  value = google_cloud_run_service.api_service.status[0].url
}