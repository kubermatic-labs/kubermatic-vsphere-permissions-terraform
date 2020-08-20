# Custom Seed Roles:

resource vsphere_role k8c_storage_vmfolder_propagate {
  name = "${var.parent_folder}_k8c-storage-vmfolder-propagate"
  role_privileges = [
    "Folder.Create",
    "Folder.Delete",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.RemoveDisk",
  ]
}

resource vsphere_role k8c_storage_datastore_propagate {
  name = "${var.parent_folder}_k8c-storage-datastore-propagate"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.FileManagement",
  ]
}

# Custom User-Cluster Roles:

resource vsphere_role k8c_user_vcenter {
  name = "${var.parent_folder}_k8c-user-vcenter"
  role_privileges = [
    "VirtualMachine.Provisioning.ModifyCustSpecs",
    "VirtualMachine.Provisioning.ReadCustSpecs",
  ]
}

resource vsphere_role k8c_user_datacenter {
  name = "${var.parent_folder}_k8c-user-datacenter"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.DeleteFile",
    "Datastore.FileManagement",
    "VApp.ApplicationConfig",
    "VApp.InstanceConfig",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Inventory.CreateFromExisting",
  ]
}

resource vsphere_role k8c_user_cluster_propagate {
  name = "${var.parent_folder}_k8c-user-cluster-propagate"
  role_privileges = [
    "Host.Config.SystemManagement",
    "Host.Local.ReconfigVM",
    "Resource.AssignVMToPool",
    "Resource.ColdMigrate",
    "Resource.HotMigrate",
    "VApp.ApplicationConfig",
    "VApp.InstanceConfig",
  ]
}

resource vsphere_role k8s_network_attach {
  name = "${var.parent_folder}_k8s-network-attach"
  role_privileges = [
    "Network.Assign",
  ]
}

resource vsphere_role k8c_user_datastore_propagate {
  name = "${var.parent_folder}_k8c-user-datastore-propagate"
  role_privileges = [
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.FileManagement",
  ]
}

resource vsphere_role k8c_user_folder_propagate {
  name = "${var.parent_folder}_k8c-user-folder-propagate"
  role_privileges = [
    "Folder.Create",
    "Folder.Delete",
    "Global.SetCustomField",
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
    "VirtualMachine.Config.UpgradeVirtualHardware",
    "VirtualMachine.GuestOperations.Execute",
    "VirtualMachine.GuestOperations.Modify",
    "VirtualMachine.GuestOperations.ModifyAliases",
    "VirtualMachine.GuestOperations.Query",
    "VirtualMachine.GuestOperations.QueryAliases",
    "VirtualMachine.Hbr.ConfigureReplication",
    "VirtualMachine.Hbr.MonitorReplication",
    "VirtualMachine.Hbr.ReplicaManagement",
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
    "VirtualMachine.Namespace.Event",
    "VirtualMachine.Namespace.EventNotify",
    "VirtualMachine.Namespace.Management",
    "VirtualMachine.Namespace.ModifyContent",
    "VirtualMachine.Namespace.Query",
    "VirtualMachine.Namespace.ReadContent",
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
    k8c_storage_vmfolder_propagate = vsphere_role.k8c_storage_vmfolder_propagate.name,
    k8c_storage_datastore_propagate = vsphere_role.k8c_storage_datastore_propagate.name,
    k8c_user_vcenter = vsphere_role.k8c_user_vcenter.name,
    k8c_user_datacenter = vsphere_role.k8c_user_datacenter.name,
    k8c_user_cluster_propagate = vsphere_role.k8c_user_cluster_propagate.name,
    k8s_network_attach = vsphere_role.k8s_network_attach.name,
    k8c_user_datastore_propagate = vsphere_role.k8c_user_datastore_propagate.name,
    k8c_user_folder_propagate = vsphere_role.k8c_user_folder_propagate.name,
  }
}