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
  description = "Shortname for the alert"
}
variable "action_group" {
  type        = string
  description = "Action Group where associated with the alert"
}

variable "metric_alerts" {
  default     = null
  description = "Define an optional block for metric alerts."
}

variable "tags" {}

