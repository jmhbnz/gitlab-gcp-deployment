#!/bin/bash



# Once we have a project we can create a new virtual machine.

# Tangle the shell block below to a shell script by pressing *, b t* in emacs command mode:


# Create name for virtual machine based on date
export gcp_machine_name="gitlab-gcp-"$(date +"%Y-%m-%d")

# Create the new machine
gcloud compute instances create $gcp_machine_name
