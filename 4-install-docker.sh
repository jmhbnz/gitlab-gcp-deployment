#!/bin/bash
# Step 3 - Install docker on virtual machine

# Next up we need to install [[https://docker.com][Docker]] on the newly created virtual machine so that we can then deploy Gitlab as a container.

# By default the virtual machine operating system for the vm we created on GCP is [[https://debian.org][Debian]]. There are instructions for installing Docker on a debian machine [[https://docs.docker.com/engine/install/debian/#install-using-the-repository][here]].


# Retrieve the vm name
  export gcp_machine_name=$(gcloud compute instances list --limit=1 --format='value(name.basename())')

# Connect to the machine using ssh
gcloud compute ssh $gcp_machine_name --ssh-key-file ~/.ssh/$USER -- "curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh"
