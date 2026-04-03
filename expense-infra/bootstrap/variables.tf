variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "location" {
  description = "Azure region for the Terraform state resources."
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource group name for Terraform state."
  type        = string
  default     = "expenseflow-tfstate-rg"
}

variable "storage_account_name_prefix" {
  description = "Prefix for the Terraform state storage account. Must be lowercase letters/numbers only."
  type        = string
  default     = "expenseflowtf"
}

variable "container_name" {
  description = "Blob container name for Terraform state."
  type        = string
  default     = "tfstate"
}

variable "tags" {
  description = "Tags for bootstrap resources."
  type        = map(string)
  default = {
    project    = "expenseflow"
    managed_by = "terraform"
    purpose    = "tfstate"
  }
}
