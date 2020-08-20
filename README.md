this is an attempt to make the needed permissions/roles to set up Kubermatic on vSphere reproducible

## what is there:

- roles are defined in [./roles.tf](./roles.tf)
- an example folder structure is created in [./folders.ts](./folders.ts)
- an example script using govc to set up vSphere users and groups is in [./scripts/create-user-and-group.sh](./scripts/create-user-and-group.sh)

## what is missing:

### actually attached permissions
because: **vsphere cannot attach users/groups and roles as permissions to entities without a BIG CAVEAT:**  
attaching permissions via the `vsphere_entity_permissions` resource will remove ALL UNMANAGED permissions from that resource!  
that means, you either manage ALL permissions on a resource with terraform, or you don't at all!

example:
1. datastore `ds-1` has a lot of manually attached permissions
1. a terraform solution wants to attach kubermatic roles to their respective users and allow access to `ds-1`
1. terraform will remove all manually attached permissions from `ds-1`
1. you are sad because this breaks other stuff