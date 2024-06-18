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
| [azurerm_monitor_activity_log_alert.mod_activity_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abv_location"></a> [abv\_location](#input\_abv\_location) | Abbreviated location (Example, wus2, eus2, etc...). It should match the location variable region. | `string` | n/a | yes |
| <a name="input_action_group"></a> [action\_group](#input\_action\_group) | Action Group where associated with the alert | `string` | n/a | yes |
| <a name="input_activity_log_alerts"></a> [activity\_log\_alerts](#input\_activity\_log\_alerts) | Define a map of activity log alerts to be created. | `any` | `null` | no |
| <a name="input_code"></a> [code](#input\_code) | An optional code to be used if additional distinction is needed. It is primarily used in the naming of resources. | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | Envionment selector. (prd, np, uat, qa, dev, poc). | `string` | n/a | yes |
| <a name="input_index"></a> [index](#input\_index) | Index used to label resource. | `string` | `"01"` | no |
| <a name="input_location"></a> [location](#input\_location) | This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...). | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Shortname for the alert | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group where the resource(s) will be provisioned. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The service is a distinction primarily used in the naming of the resources. This is generally based on the module or super module naming. | `string` | `"svc"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of Activity Log Alert |
| <a name="output_name"></a> [name](#output\_name) | Name of Activity Log Alert |
