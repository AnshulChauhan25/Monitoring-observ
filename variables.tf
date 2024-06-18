#Envionment
variable "env_name" {
  type        = string
  description = "This is the abbreviated version of the environment where resources will be provisioned.  This is commonly used in names of resources."
}

variable "env" {
  type        = string
  description = "Envionment selector. (prd, uat, qa, dev)."
}

variable "location" {
  type        = string
  description = "This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...)."
}

variable "abv_location" {
  type        = string
  description = "Abbreviated location (Example, wus2, eus2, etc...). It should match the location variable region."
}

#Tags
variable "tags" {
  description = "Tags to add to the resource(s)"
}

variable "service" {
  type        = string
  description = "The service is a distinction primarily used in the naming of the resources. This is generally based on the module or super module naming."
  default     = "net"
}

variable "code" {
  type        = string
  description = "An optional code to be used if additional distinction is needed. It is primarily used in the naming of resources."
  default     = ""
}

variable "project_index" {
  type        = string
  default     = "01"
  description = "Project index value for use in various resources/modules, primarily used in naming."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the resources will be created under."
}

#Action Group(s)
variable "action_groups" {
  description = "Action Group Info to provision the needed Action Group resources"
}

variable "query_alerts" {
  description = "Query alert Info to provision the needed query alert resources"
  default     = null
}

variable "metric_alerts" {
  description = "Metric alert Info to provision the needed metric alert resources"
  default     = null
}

variable "activity_alerts" {
  description = "Activity alert Info to provision the needed activity log alert resources"
  default     = null
}
