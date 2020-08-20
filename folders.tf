resource vsphere_folder parent {
  path          = var.parent_folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_folder kubeone {
  path          = "${vsphere_folder.parent.path}/kubeone"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_folder kubeone_control_plane {
  path          = "${vsphere_folder.kubeone.path}/control-plane"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_folder kubeone_workers {
  path          = "${vsphere_folder.kubeone.path}/workers"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_folder kubermatic {
  path          = "${vsphere_folder.parent.path}/kubermatic"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_folder kubermatic_clusters {
  path          = "${vsphere_folder.kubermatic.path}/clusters"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}