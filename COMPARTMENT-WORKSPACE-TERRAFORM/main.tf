locals {
  env_config = {
    default = {
        # Compartment
      compartment_name = "COMPARTMENT-WORKSPACE-DEV"
      description      = "Compartment de desenvolvimento"

        # VCN
      vcn_display_name = "VCN-WORKSPACE-DEV"
      vcn_cidr_block = "10.0.0.0/16"
    }
    prod = {
        # Compartment
      compartment_name = "COMPARTMENT-WORKSPACE-PROD"
      description      = "Compartment de producao"

        # VCN
      vcn_display_name = "VCN-WORKSPACE-PROD"
      vcn_cidr_block = "172.16.0.0/16"
    }
  }

  env = lookup(local.env_config, terraform.workspace, local.env_config["default"])
}

resource "oci_identity_compartment" "compartment-workspace" {
  compartment_id = var.tenancy_ocid
  name           = local.env.compartment_name
  description    = local.env.description
  enable_delete  = true
}

resource "oci_core_vcn" "vcn-workspace" {
    compartment_id = oci_identity_compartment.compartment-workspace.id
    display_name = local.env.vcn_display_name
    cidr_block = local.env.vcn_cidr_block
}