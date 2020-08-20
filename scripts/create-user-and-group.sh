#!/bin/bash

govc sso.group.create -d="Group for Seed-Cluster Users" joshy-test-seed
govc sso.group.create -d="Group for User-Cluster Users" joshy-test-user-cluster

govc sso.user.create -p "randompw" -R RegularUser -d "joshy-test-seed-user" joshy-test-seed-user
govc sso.group.update -a joshy-test-seed-user joshy-test-seed

govc sso.user.create -p "randompw" -R RegularUser -d "joshy-test-user-cluster-user" joshy-test-user-cluster-user
govc sso.group.update -a joshy-test-user-cluster-user joshy-test-user-cluster
