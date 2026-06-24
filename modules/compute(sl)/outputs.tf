output "images_found" {
  value = length(data.oci_core_images.images.images)
}

output "shape" {
  value = var.shape
}

output "images" {
  value = data.oci_core_images.images.images
}