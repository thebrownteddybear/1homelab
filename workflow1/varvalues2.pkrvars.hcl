vsphere_vcenter         = "192.168.254.133"
vsphere_username        = "administrator@vsphere.local"
vsphere_password        = "VMware1!"
vsphere_datacenter      = "dc1"
vsphere_cluster         = "NSXT-EDGECLUSTER"
parent_host             = "192.168.254.108"
vsphere_datastore       = "iscsi108"
vnic_network            = "VM Network"
vm_name1                = "template-esxi001"
vm_name2                = "template-esxi002"
vm_name3                = "template-esxi003"
vm_name4                = "template-esxi004"
vm_hostname             = "esxi004"
vm_guestos              = "vmkernel7guest"
vm_cpu_size             = "8"
vm_ram_size             = "16384"
vm_disk_size            = "8192"
guest_username          = "root"
guest_password          = "VMware1!"
ssh_timeout             = "15m"
nfs_server_path         = "192.168.254.123/ks/ks.cfg"
iso_file_path           = "7.02a.iso"
vm_disk_controller      = "pvscsi"


guest_template          = "template-esxi001"