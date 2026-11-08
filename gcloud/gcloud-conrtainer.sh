# register container instance service to be used
gcloud services enable run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com

# execute a container with these arguments
gcloud run deploy hello-run \
  --image us-docker.pkg.dev/cloudrun/container/hello \
  --region europe-west1 \
  --allow-unauthenticated

# Delete all resources
gcloud run services delete hello-run --region europe-west1