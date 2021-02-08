#!/bin/bash


# Next up we need to copy file to gloud vm


# Retrieve the vm name
export gcp_machine_name=$(gcloud compute instances list --limit=1 --format='value(name.basename())')

# Copy file to vm
gcloud compute scp docker-compose.yaml $gcp_machine_name:/tmp --ssh-key-file ~/.ssh/$USER --strict-host-key-checking=no

# Install gotlan with docker compose
#sleep 2
#gcloud compute ssh $gcp_machine_name --ssh-key-file ~/.ssh/$USER -- 'sudo docker compose up -d'
