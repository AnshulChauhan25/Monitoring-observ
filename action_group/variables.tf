variable "resource_group_name" {
  type        = string
  description = "Resource Group where the resource(s) will be provisioned."
}

variable "location" {
  type        = string
  description = "This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...)."
}

variable "abv_location" {
  type        = string
  description = "Abbreviated location (Example, wus2, eus2, etc...). It should match the location variable region."
}

variable "env" {
  type        = string
  description = "Envionment selector. (prd, np, uat, qa, dev, poc)."
}

variable "index" {
  type        = string
  description = "Index used to label resource."
  default     = "01"
}

variable "service" {
  type        = string
  description = "The service is a distinction primarily used in the naming of the resources. This is generally based on the module or super module naming."
  default     = "svc"
}

variable "code" {
  type        = string
  description = "An optional code to be used if additional distinction is needed. It is primarily used in the naming of resources."
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the Alert Group.  This will be prefixed/sufixed with additional text. (Location-ENV-name-AG-index)"
}


variable "use_common_alert_schema" {
  type        = bool
  default     = true
  description = "Enables or disables the common alert schema."
}

variable "email_receiver" {
  type = list(object({
    name          = string,
    email_address = string
  }))
  default     = []
  description = "List of objects for email group actions to be created."
}

variable "sms_receiver" {
  type = list(object({
    name         = string,
    phone_number = string
  }))
  default     = []
  description = "List of objects for sms group actions to be created. Defaults to country code 1."
}

variable "webhook_receiver" {
  type = list(object({
    name        = string,
    service_uri = string
  }))
  default     = []
  description = "List of objects for web hook group actions to be created."
}

variable "automation_runbook_receiver" {
  type = list(object({
    name                  = string,
    automation_account_id = string,
    runbook_name          = string,
    webhook_resource_id   = string,
    is_global_runbook     = bool,
    service_uri           = string
  }))
  default     = []
  description = "List of objects for web hook group actions to be created."
}


variable "tags" {}
