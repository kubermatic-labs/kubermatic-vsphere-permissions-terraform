#!/bin/bash

govc sso.group.create -d="Group for Seed-Cluster Users" example-ccm-user
govc sso.group.create -d="Group for User-Cluster Users" example-infra-management-user

govc sso.user.create -p "randompw" -R RegularUser -d "example-ccm-user" example-ccm-user
govc sso.group.update -a example-ccm-user example-ccm-user

govc sso.user.create -p "randompw" -R RegularUser -d "example-infra-management-user" example-infra-management-user
govc sso.group.update -a example-infra-management-user example-infra-management-user
