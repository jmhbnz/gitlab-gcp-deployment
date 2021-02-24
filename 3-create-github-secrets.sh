#!/bin/bash
# Step 3 - Configure GitHub secrets...

# Once new service account is created and key.json file is created, We will have to upload these details into GitHub and automate the end to end CI/CD workflow.

# Tangle the shell block below to a shell script by pressing *, b t* in emacs command mode:


echo $gcp_project_id | gh secret set GCP_PROJECT_ID
cat key.json | jq '.client_email' -r | gh secret set GCP_EMAIL
cat key.json | gh secret set GCP_CREDENTIALS
