######### CLOUD CONTROLLER MANAGER CCM / CSI ########
# DOCU: https://docs.kubermatic.com/kubermatic/v2.26/architecture/supported-providers/vsphere/#cloud-controller-manager-ccm--csi

###### Role `k8c-ccm-storage-vmfolder-propagate`
#* Granted at **VM Folder** and **Template Folder**, propagated
#* Permissions
#  * Virtual machine
#    * Change Configuration
#      * Add existing disk
#      * Add new disk
#      * Add or remove device
#      * Remove disk
#  * Folder
#    * Create folder
#    * Delete dolder
resource vsphere_role k8c_ccm_storage_vmfolder_propagate {
  name = "${var.role_prefix}_k8c-ccm-storage-vmfolder-propagate"
  role_privileges = [
    "Folder.Create",
    "Folder.Delete",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.RemoveDisk",
  ]
}

###### Role `k8c-ccm-storage-datastore-propagate`
#* Granted at **Datastore**, propagated
#* Permissions
#  * Datastore
#    * Allocate space
#    * Low level file operations
resource vsphere_role k8c_ccm_storage_datastore_propagate {
  name = "${var.role_prefix}_k8c-ccm-storage-datastore-propagate"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.FileManagement",
  ]
}

##### Role `k8c-ccm-storage-cns`
#* Granted at **vcenter** level, not propagated
#* Permissions
#  * CNS
#    * Searchable
resource vsphere_role k8c_ccm_storage_cns {
  name = "${var.role_prefix}_k8c-ccm-storage-cns"
  role_privileges = [
    "Cns.Searchable",
  ]
}

### ##### Role `Read-only` (predefined)
#* Granted at ..., **not** propagated
#  * Datacenter
#  * All hosts where the nodes VMs reside.
### Rights
#System.Anonymous
#System.Read
#System.View
data "vsphere_role" "read_only" {
  label = "Read-only"
}

######### INFRASTRUCTURE MANAGEMENT ROLES FOR USER CLUSTER VMS ###

###### Role `k8c-user-vcenter`
#* Granted at **vcenter** level, **not** propagated
#* Needed to customize VM during provisioning
#* Permissions
#  * CNS
#    * Searchable
#  * Profile-driven storage
#    * Profile-driven storage view
#  * VirtualMachine
#    * Provisioning
#      * Modify customization specification
#      * Read customization specifications
#  * vSphere Tagging
#      * Assign or Unassign vSphere Tag
#      * Assign or Unassign vSphere Tag on Object
#      * Create vSphere Tag
#      * Create vSphere Tag Category
#      * Delete vSphere Tag
#      * Delete vSphere Tag Category
#      * Edit vSphere Tag
#      * Edit vSphere Tag Category
#      * Modify UsedBy Field For Category
#      * Modify UsedBy Field For Tag
resource vsphere_role k8c_user_vcenter {
  name = "${var.role_prefix}_k8c-user-vcenter"
  role_privileges = [
    "Cns.Searchable",
    "InventoryService.Tagging.AttachTag",
    "InventoryService.Tagging.CreateCategory",
    "InventoryService.Tagging.CreateTag",
    "InventoryService.Tagging.DeleteCategory",
    "InventoryService.Tagging.DeleteTag",
    "InventoryService.Tagging.EditCategory",
    "InventoryService.Tagging.EditTag",
    "InventoryService.Tagging.ModifyUsedByForCategory",
    "InventoryService.Tagging.ModifyUsedByForTag",
    "InventoryService.Tagging.ObjectAttachable",
    "StorageProfile.View",
    "System.Anonymous",
    "System.Read",
    "System.View",
    "VirtualMachine.Provisioning.ModifyCustSpecs",
    "VirtualMachine.Provisioning.ReadCustSpecs",
  ]
}

###### Role `k8c-user-datacenter`
#* Granted at **datacenter** level, **not** propagated
#* Needed for cloning the template VM (obviously this is not done in a folder at this time)
#* Permissions
#  * Datastore
#    * Allocate space
#    * Browse datastore
#    * Low level file operations
#    * Remove file
#  * vApp
#    * vApp application configuration
#    * vApp instance configuration
#  * Virtual Machine
#    * Change Configuration
#      * Change CPU count
#      * Change Memory
#      * Change Settings
#    * Edit Inventory
#      * Create from existing
#  * vSphere Tagging
#    * Assign or Unassign vSphere Tag on Object
resource vsphere_role k8c_user_datacenter {
  name = "${var.role_prefix}_k8c-user-datacenter"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.DeleteFile",
    "Datastore.FileManagement",
    "InventoryService.Tagging.ObjectAttachable",
    "System.Anonymous",
    "System.Read",
    "System.View",
    "VApp.ApplicationConfig",
    "VApp.InstanceConfig",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Inventory.CreateFromExisting",
  ]
}

#* Role `k8c-user-cluster-propagate`
#  * Granted at **cluster** level, propagated
#  * Needed for upload of `cloud-init.iso` (Ubuntu and CentOS) or defining the Ignition config into Guestinfo (CoreOS)
#  * Permissions
#    * AutoDeploy
#      * Rule
#        * Create
#        * Delete
#        * Edit
#    * Folder
#      * Create folder
#    * Host
#      * Configuration
#        * Storage partition configuration
#        * System Management
#      * Local operations
#        * Reconfigure virtual machine
#      * Inventory
#        * Modify cluster
#    * Resource
#      * Assign virtual machine to resource pool
#      * Migrate powered off virtual machine
#      * Migrate powered on virtual machine
#    * vApp
#      * vApp application configuration
#      * vApp instance configuration
#    * vSphere Tagging
#      * Assign or Unassign vSphere Tag on Object
resource vsphere_role k8c_user_cluster_propagate {
  name = "${var.role_prefix}_k8c-user-cluster-propagate"
  role_privileges = [
    "AutoDeploy.Rule.Create",
    "AutoDeploy.Rule.Delete",
    "AutoDeploy.Rule.Edit",
    "Folder.Create",
    "Host.Config.Storage",
    "Host.Config.SystemManagement",
    "Host.Inventory.EditCluster",
    "Host.Local.ReconfigVM",
    "InventoryService.Tagging.ObjectAttachable",
    "Resource.AssignVMToPool",
    "Resource.ColdMigrate",
    "Resource.HotMigrate",
    "VApp.ApplicationConfig",
    "VApp.InstanceConfig",
  ]
}

###### Role `k8c-network-attach`
#* Granted for each network that should be used (distributed switch + network)
#* Permissions
#  * Network
#    * Assign network
#  * vSphere Tagging
#    * Assign or Unassign vSphere Tag on Object
resource vsphere_role k8s_network_attach {
  name = "${var.role_prefix}_k8s-network-attach"
  role_privileges = [
    "InventoryService.Tagging.ObjectAttachable",
    "Network.Assign",
    "System.Anonymous",
    "System.Read",
    "System.View",
  ]
}

###### Role `k8c-user-datastore-propagate`
#* Granted at **datastore / datastore cluster** level, propagated
#* Also provides permission to create vSphere tags for a dedicated category, which are required by KKP seed controller manager
#* Please note below points about tagging.
#
#**Note**: If a category id is assigned to a user cluster, KKP would claim the ownership of any tags it creates. KKP would try to delete tags assigned to the cluster upon cluster deletion. Thus, make sure that the assigned category isn't shared across other lingering resources.
#
#**Note**: Tags can be attached to machine deployments regardless if the tags are created via KKP or not.
#If a tag was not attached to the user cluster, machine controller will only detach it.
#* Permissions
#  * Datastore
#    * Allocate space
#    * Browse datastore
#    * Low level file operations
#  * vSphere Tagging
#    * Assign or Unassign vSphere Tag on an Object
resource vsphere_role k8c_user_datastore_propagate {
  name = "${var.role_prefix}_k8c-user-datastore-propagate"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.FileManagement",
    "InventoryService.Tagging.ObjectAttachable",
    "System.Anonymous",
    "System.Read",
    "System.View",
  ]
}

###### Role `k8c-user-folder-propagate`
#* Granted at **VM Folder** and **Template Folder** level, propagated
#* Needed for managing the node VMs
#* Permissions
#  * Folder
#    * Create folder
#    * Delete folder
#  * Global
#    * Set custom attribute
#  * Virtual machine
#    * Change Configuration
#    * Edit Inventory
#    * Guest operations
#    * Interaction
#    * Provisioning
#    * Snapshot management
#  * vSphere Tagging
#    * Assign or Unassign vSphere Tag
#    * Assign or Unassign vSphere Tag on an Object
#    * Create vSphere Tag
#    * Delete vSphere Tag
resource vsphere_role k8c_user_folder_propagate {
  name = "${var.role_prefix}_k8c-user-folder-propagate"
  role_privileges = [
    "Folder.Create",
    "Folder.Delete",
    "Global.SetCustomField",
    "InventoryService.Tagging.CreateTag",
    "InventoryService.Tagging.DeleteTag",
    "InventoryService.Tagging.AttachTag",
    "InventoryService.Tagging.ObjectAttachable",
    "System.Anonymous",
    "System.Read",
    "System.View",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.AdvancedConfig",
    "VirtualMachine.Config.Annotation",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.ChangeTracking",
    "VirtualMachine.Config.DiskExtend",
    "VirtualMachine.Config.DiskLease",
    "VirtualMachine.Config.EditDevice",
    "VirtualMachine.Config.HostUSBDevice",
    "VirtualMachine.Config.ManagedBy",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.MksControl",
    "VirtualMachine.Config.QueryFTCompatibility",
    "VirtualMachine.Config.QueryUnownedFiles",
    "VirtualMachine.Config.RawDevice",
    "VirtualMachine.Config.ReloadFromPath",
    "VirtualMachine.Config.RemoveDisk",
    "VirtualMachine.Config.Rename",
    "VirtualMachine.Config.ResetGuestInfo",
    "VirtualMachine.Config.Resource",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Config.SwapPlacement",
    "VirtualMachine.Config.ToggleForkParent",
    #"VirtualMachine.Config.Unlock",
    "VirtualMachine.Config.UpgradeVirtualHardware",
    "VirtualMachine.GuestOperations.Execute",
    "VirtualMachine.GuestOperations.Modify",
    "VirtualMachine.GuestOperations.ModifyAliases",
    "VirtualMachine.GuestOperations.Query",
    "VirtualMachine.GuestOperations.QueryAliases",
    "VirtualMachine.Interact.AnswerQuestion",
    "VirtualMachine.Interact.Backup",
    "VirtualMachine.Interact.ConsoleInteract",
    "VirtualMachine.Interact.CreateScreenshot",
    "VirtualMachine.Interact.CreateSecondary",
    "VirtualMachine.Interact.DefragmentAllDisks",
    "VirtualMachine.Interact.DeviceConnection",
    "VirtualMachine.Interact.DisableSecondary",
    "VirtualMachine.Interact.DnD",
    "VirtualMachine.Interact.EnableSecondary",
    "VirtualMachine.Interact.GuestControl",
    "VirtualMachine.Interact.MakePrimary",
    "VirtualMachine.Interact.Pause",
    "VirtualMachine.Interact.PowerOff",
    "VirtualMachine.Interact.PowerOn",
    "VirtualMachine.Interact.PutUsbScanCodes",
    "VirtualMachine.Interact.Record",
    "VirtualMachine.Interact.Replay",
    "VirtualMachine.Interact.Reset",
    "VirtualMachine.Interact.SESparseMaintenance",
    "VirtualMachine.Interact.SetCDMedia",
    "VirtualMachine.Interact.SetFloppyMedia",
    "VirtualMachine.Interact.Suspend",
    "VirtualMachine.Interact.TerminateFaultTolerantVM",
    "VirtualMachine.Interact.ToolsInstall",
    "VirtualMachine.Interact.TurnOffFaultTolerance",
    "VirtualMachine.Inventory.Create",
    "VirtualMachine.Inventory.CreateFromExisting",
    "VirtualMachine.Inventory.Delete",
    "VirtualMachine.Inventory.Move",
    "VirtualMachine.Inventory.Register",
    "VirtualMachine.Inventory.Unregister",
    "VirtualMachine.Provisioning.Clone",
    "VirtualMachine.Provisioning.CloneTemplate",
    "VirtualMachine.Provisioning.CreateTemplateFromVM",
    "VirtualMachine.Provisioning.Customize",
    "VirtualMachine.Provisioning.DeployTemplate",
    "VirtualMachine.Provisioning.DiskRandomAccess",
    "VirtualMachine.Provisioning.DiskRandomRead",
    "VirtualMachine.Provisioning.FileRandomAccess",
    "VirtualMachine.Provisioning.GetVmFiles",
    "VirtualMachine.Provisioning.MarkAsTemplate",
    "VirtualMachine.Provisioning.MarkAsVM",
    "VirtualMachine.Provisioning.ModifyCustSpecs",
    "VirtualMachine.Provisioning.PromoteDisks",
    "VirtualMachine.Provisioning.PutVmFiles",
    "VirtualMachine.Provisioning.ReadCustSpecs",
    "VirtualMachine.State.CreateSnapshot",
    "VirtualMachine.State.RemoveSnapshot",
    "VirtualMachine.State.RenameSnapshot",
    "VirtualMachine.State.RevertToSnapshot",
  ]
}

output vsphere_roles {
  value = {
    k8c_ccm_storage_vmfolder_propagate = vsphere_role.k8c_ccm_storage_vmfolder_propagate.name,
    k8c_ccm_storage_datastore_propagate = vsphere_role.k8c_ccm_storage_datastore_propagate.name,
    k8c_ccm_storage_cns = vsphere_role.k8c_ccm_storage_cns.name,
    k8c_read_only = data.vsphere_role.read_only
    k8c_user_vcenter = vsphere_role.k8c_user_vcenter.name,
    k8c_user_datacenter = vsphere_role.k8c_user_datacenter.name,
    k8c_user_cluster_propagate = vsphere_role.k8c_user_cluster_propagate.name,
    k8s_network_attach = vsphere_role.k8s_network_attach.name,
    k8c_user_datastore_propagate = vsphere_role.k8c_user_datastore_propagate.name,
    k8c_user_folder_propagate = vsphere_role.k8c_user_folder_propagate.name,
  }
}
