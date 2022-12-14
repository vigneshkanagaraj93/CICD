#!/bin/bash

# fail on any error 
set -eu

#install yum-config-manager to manager your repositories
sudo yum install -y yum-utils

#install yum-config-manager to add the official HashiCorp linux respository
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
 
#install terraform
sudo yum -y install terraform

#verify terraform is installed
terraform --version
