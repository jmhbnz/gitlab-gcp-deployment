#!/bin/bash
# Step 4 - Create virtual machine

# Once we have a project we can create a new virtual machine. To create a virtual machine we need to ensure compute engine apis are enabled.

# Tangle the shell block below to a shell script by pressing *, b t* in emacs command mode:


# Set default project
gcloud config set project "gitlab-gcp-ci"

# Ensure compute engine apis are enabled in the project
gcloud services enable compute.googleapis.com

# Create name for virtual machine based on date
export gcp_machine_name="gitlab-gcp-"$(date +"%s")

# Create the new machine
gcloud compute instances create $gcp_machine_name --zone australia-southeast1-a
