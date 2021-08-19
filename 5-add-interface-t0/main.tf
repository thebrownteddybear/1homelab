terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host                  = "192.168.254.61"
  username              = "admin"
  password              = "VMware1!VMware1!"
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

data "nsxt_policy_tier0_gateway" "t0_red" {
  display_name = "t0_red"
}

data "nsxt_policy_edge_cluster" "edge-cluster01" {
  display_name = "edge-cluster01"
}

data "nsxt_policy_transport_zone" "nsx-overlay-transportzone" {
  display_name = "nsx-overlay-transportzone"
}
data "nsxt_policy_edge_node" "edge01a" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge-cluster01.path
  member_index      = 0
}

data "nsxt_policy_edge_node" "edge02a" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge-cluster01.path
  member_index      = 1
}
# resource "nsxt_policy_vlan_segment" "seg-uplink36" {
#   display_name = "seg-uplink36"
#   vlan_ids     = [12]
# }

resource "nsxt_policy_segment" "segment1" {
  display_name        = "segment1"
  description         = "Terraform provisioned Segment"
  transport_zone_path = data.nsxt_policy_transport_zone.nsx-overlay-transportzone.path
}
resource "nsxt_policy_tier0_gateway_interface" "red_vrf_uplink1" {
  count=30

  display_name   = "seg-uplink1"
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.edge01a.path
  gateway_path   = nsxt_policy_tier0_gateway.t0_red.path
  segment_path   = nsxt_policy_vlan_segment.segment1.path
  # access_vlan_id = 112
  subnets        = ["192.168.112.254/24"]
  mtu            = 1500

  # depends_on = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
}