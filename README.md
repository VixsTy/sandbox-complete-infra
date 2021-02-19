# Infra - GCP - Complete

This repositories will be use to learn things around Creation and Operation of a cluster Kubernetes into Google Cloud Platform

## Getting started

Before starting, you will need to following [pre-requisite](infra/README.md#pre-requisite)

```
# Define the GOOGLE_PROJECT and GOOGLE_APPLICATION_CREDENTIALS environment variable.
Λ\: export GOOGLE_PROJECT=$(gcloud config get-value project)
Λ\: gcloud iam service-accounts keys create terraform-dev.json --iam-account terraform-dev@$GOOGLE_PROJECT.iam.gserviceaccount.com
Λ\: export GOOGLE_APPLICATION_CREDENTIALS=$PWD/terraform-dev.json
# OPTIONAL
Λ\: export GOOGLE_REGION=$(gcloud config get-value compute/region)
Λ\: export GOOGLE_ZONE=$(gcloud config get-value compute/zone)
# deploy infra
Λ\: infra/deploy.sh
```
