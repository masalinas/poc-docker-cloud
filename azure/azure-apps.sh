#Create App Container
az containerapp up \
  --resource-group rg-docker-curso \
  --name hello-app \
  --location northeurope \
  --image mcr.microsoft.com/k8se/quickstart:latest \
  --target-port 80 \
  --ingress external

# Delete all resources
az group delete --name rg-docker-curso --yes --no-wait
az group exists --name rg-docker-curso

az group list -o table
az resource list -o table