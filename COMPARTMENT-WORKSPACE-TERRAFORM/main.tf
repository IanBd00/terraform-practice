locals {
  env_config = {
    dev = {
        # VCN
      vcn_display_name = "VCN-WORKSPACE-DEV"
      vcn_cidr_block = "10.0.0.0/16"

      igw_display_name = "IGW-DEV"

      rt_public_display_name = "RT-PUBLIC-DEV"
    }
    prod = {
        # VCN
      vcn_display_name = "VCN-WORKSPACE-PROD"
      vcn_cidr_block = "172.16.0.0/16"

      igw_display_name = "IGW-PROD"

      rt_public_display_name = "RT-PUBLIC-PROD"
    }
  }

  env = lookup(local.env_config, terraform.workspace, local.env_config["dev"])
}

resource "oci_core_vcn" "vcn-workspace" {
    compartment_id = var.compartment_id
    display_name = local.env.vcn_display_name
    cidr_block = local.env.vcn_cidr_block
}

resource "oci_core_internet_gateway" "igw-workspace" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vcn-workspace.id
  display_name = local.env.igw_display_name
}

resource "oci_core_route_table" "rt-workspace" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vcn-workspace.id
  display_name = local.env.rt_public_display_name

  route_rules {
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw-workspace.id
  }
}