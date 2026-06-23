# resource "oci_identity_compartment" "compartment-workspace" {
#   compartment_id = var.tenancy_ocid
#   name           = "COMPARTMENT-WORKSPACE-TERRAFORM"
#   description    = "Estudos de terraform workspace, divisão por dev e prod."
#   enable_delete  = true
# }