# login and create a resources group
az login
az group create --name rg-docker-curso --location northeurope

# register container instance service to be used
az provider register --namespace Microsoft.ContainerInstance --wait
az provider show --namespace Microsoft.ContainerInstance --query registrationState -o tsv

# execute a container with these arguments
az container create \
  --resource-group rg-docker-curso \
  --name hello-aci \
  --location northeurope \
  --os-type Linux \
  --image mcr.microsoft.com/azuredocs/aci-helloworld \
  --dns-name-label hello-aci-training\
  --ports 80 \
  --cpu 1 --memory 1.5

# get URL pública
az container show -g rg-docker-curso -n hello-aci --query ipAddress.fqdn -o tsv

# Logs y estado
az container logs -g rg-docker-curso -n hello-aci
az container show -g rg-docker-curso -n hello-aci --query instanceView.state -o tsv

# Delete all resources
az group delete --name rg-docker-curso --yes --no-wait
az group exists --name rg-docker-curso

az group list -o table
az resource list -o table