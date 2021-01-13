#!/bin/bash


# Once we have authenticated we can create a project and then create a new virtual machine instance within that project.

# #+NAME: Create a new google cloud project

# Create a project id based on date
export gcp_project_id="gitlab-gcp-"$(date +"%Y-%m-%d")

# Create new project using a random project id
gcloud projects create $gcp_project_id

# Ensure billing is enabled for the project
export gcp_billing_account=$(gcloud alpha billing accounts list --limit=1 --format='value(name.basename())')
gcloud alpha billing projects link $gcp_project_id --billing-account $gcp_billing_account
