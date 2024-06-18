## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.75 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.75 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.mod_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abv_location"></a> [abv\_location](#input\_abv\_location) | Abbreviated location (Example, wus2, eus2, etc...). It should match the location variable region. | `string` | n/a | yes |
| <a name="input_automation_runbook_receiver"></a> [automation\_runbook\_receiver](#input\_automation\_runbook\_receiver) | List of objects for web hook group actions to be created. | <pre>list(object({<br>    name                  = string,<br>    automation_account_id = string,<br>    runbook_name          = string,<br>    webhook_resource_id   = string,<br>    is_global_runbook     = bool,<br>    service_uri           = string<br>  }))</pre> | `[]` | no |
| <a name="input_code"></a> [code](#input\_code) | An optional code to be used if additional distinction is needed. It is primarily used in the naming of resources. | `string` | `""` | no |
| <a name="input_email_receiver"></a> [email\_receiver](#input\_email\_receiver) | List of objects for email group actions to be created. | <pre>list(object({<br>    name          = string,<br>    email_address = string<br>  }))</pre> | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | Envionment selector. (prd, np, uat, qa, dev, poc). | `string` | n/a | yes |
| <a name="input_index"></a> [index](#input\_index) | Index used to label resource. | `string` | `"01"` | no |
| <a name="input_location"></a> [location](#input\_location) | This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...). | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Alert Group.  This will be prefixed/sufixed with additional text. (Location-ENV-name-AG-index) | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group where the resource(s) will be provisioned. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The service is a distinction primarily used in the naming of the resources. This is generally based on the module or super module naming. | `string` | `"svc"` | no |
| <a name="input_sms_receiver"></a> [sms\_receiver](#input\_sms\_receiver) | List of objects for sms group actions to be created. Defaults to country code 1. | <pre>list(object({<br>    name         = string,<br>    phone_number = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_use_common_alert_schema"></a> [use\_common\_alert\_schema](#input\_use\_common\_alert\_schema) | Enables or disables the common alert schema. | `bool` | `true` | no |
| <a name="input_webhook_receiver"></a> [webhook\_receiver](#input\_webhook\_receiver) | List of objects for web hook group actions to be created. | <pre>list(object({<br>    name        = string,<br>    service_uri = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of action group |
| <a name="output_name"></a> [name](#output\_name) | Name of action group |
