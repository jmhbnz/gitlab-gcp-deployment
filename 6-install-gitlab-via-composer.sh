#!/bin/bash


# Next up we need to tranfer file to gcloud vm and install the gitlab via docker composer


# Retrieve the vm name
export gcp_machine_name=$(gcloud compute instances list --limit=1 --format='value(name.basename())')

# Copy file to vm
gcloud compute scp docker-compose.yaml $gcp_machine_name:/home/$USER --ssh-key-file ~/.ssh/$USER --strict-host-key-checking=no

# Install gitlab with docker compose
gcloud compute ssh $gcp_machine_name --ssh-key-file ~/.ssh/$USER -- 'sudo docker-compose up -d'
