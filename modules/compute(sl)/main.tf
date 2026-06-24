data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_id
}

data "oci_core_images" "images" {
  compartment_id   = var.compartment_id
  operating_system = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape = var.shape

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

resource "oci_core_instance" "this" {
  display_name        = var.instancename
  compartment_id      = var.compartment_id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  shape               = var.shape

  source_details {
    source_id   = data.oci_core_images.images.images[0].id
    source_type = "image"
  }

  shape_config {
    ocpus = var.ocpu
    memory_in_gbs = var.ram
  }

  create_vnic_details {
    subnet_id        = var.public_subnet_id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}