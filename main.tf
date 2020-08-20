# BE CAREFUL: vsphere_entity_permissions will RMOVE ALL UNMANAGED PERMISSIONS FROM THE TARGET!!!

# variable "seed_group" {
#   default = "joshy-test-seed"
# }

# variable "user_cluster_group" {
#   default = "joshy-test-user-cluster"
# }

# data vsphere_datastore datastore {
#   name          = var.datastore_name
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource vsphere_entity_permissions seed_vm_folder {
#   entity_id = vsphere_folder.parent.id
#   entity_type = "Folder"
#   permissions {
#     user_or_group = "vsphere.local\\${var.seed_group}"
#     propagate = true
#     is_group = true
#     role_id = vsphere_role.seed_k8c_storage_vmfolder_propagate.id
#   }
# }

# resource vsphere_entity_permissions datastore {
#   entity_id = data.vsphere_datastore.datastore.id
#   entity_type = "Datastore"
#   permissions {
#     user_or_group = "vsphere.local\\${var.seed_group}"
#     propagate = true
#     is_group = true
#     role_id = vsphere_role.seed_k8c_storage_datastore_propagate.id
#   }
# }
