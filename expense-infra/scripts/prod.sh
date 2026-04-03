#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP_NAME="expenseflow-tfstate-rg"
STORAGE_ACCOUNT_NAME="expenseflowprodtfstate"
CONTAINER_NAME="tfstate"
LOCATION="centralindia"

if ! command -v az >/dev/null 2>&1; then
  echo "Azure CLI is not installed or not available in PATH."
  exit 1
fi

echo "Creating resource group: ${RESOURCE_GROUP_NAME}"
az group create \
  --name "${RESOURCE_GROUP_NAME}" \
  --location "${LOCATION}"

echo "Creating storage account: ${STORAGE_ACCOUNT_NAME}"
az storage account create \
  --resource-group "${RESOURCE_GROUP_NAME}" \
  --name "${STORAGE_ACCOUNT_NAME}" \
  --location "${LOCATION}" \
  --sku Standard_LRS \
  --encryption-services blob

echo "Creating blob container: ${CONTAINER_NAME}"
az storage container create \
  --name "${CONTAINER_NAME}" \
  --account-name "${STORAGE_ACCOUNT_NAME}" \
  --auth-mode login

echo "Prod Terraform state bootstrap complete."
echo "Resource Group  : ${RESOURCE_GROUP_NAME}"
echo "Storage Account : ${STORAGE_ACCOUNT_NAME}"
echo "Container       : ${CONTAINER_NAME}"
