#!/bin/bash


# Once we have authenticated we can create a project and then create a new virtual machine instance within that project.

# Firstly let's create a new project, a project is the logical boundary all our cloud resources for this deployment will live within. To be able to deploy resources we also need to enable billing.

# Tangle the shell block below to a shell script by pressing *, b t* in emacs command mode:

# #+NAME: Create a new google cloud project

# Create a project id based on date
export gcp_project_id="gitlab-gcp-ci"

# Create new project using a random project id
gcloud projects create $gcp_project_id

# Ensure billing is enabled for the project
export gcp_billing_account=$(gcloud alpha billing accounts list --limit=1 --format='value(name.basename())')
gcloud alpha billing projects link $gcp_project_id --billing-account $gcp_billing_account

# Make sure the project is set active
gcloud config set project $gcp_project_id

# Create service accounts
gcloud iam service-accounts create $gcp_project_id-sa \
  --description="GitHub actions deploy account" \
  --display-name="GitHub-Action-Deploy"

# Assign role
gcloud projects add-iam-policy-binding $gcp_project_id \
  --member=serviceAccount:$gcp_project_id-sa@$gcp_project_id.iam.gserviceaccount.com \
  --role=roles/compute.instanceAdmin.v1

gcloud projects add-iam-policy-binding $gcp_project_id \
  --member=serviceAccount:$gcp_project_id-sa@$gcp_project_id.iam.gserviceaccount.com \
  --role=roles/iam.serviceAccountUser

gcloud iam service-accounts keys create key.json \
  --iam-account $gcp_project_id-sa@$gcp_project_id.iam.gserviceaccount.com
