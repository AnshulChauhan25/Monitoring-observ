## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.75 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_action_groups"></a> [action\_groups](#module\_action\_groups) | ../terraform-azurerm-monitor_action_group | n/a |
| <a name="module_activity_alerts"></a> [activity\_alerts](#module\_activity\_alerts) | ../terraform-azurerm-monitor_activity_alert | n/a |
| <a name="module_metric_alerts"></a> [metric\_alerts](#module\_metric\_alerts) | ../terraform-azurerm-monitor_metric_alert | n/a |
| <a name="module_query_alerts"></a> [query\_alerts](#module\_query\_alerts) | ../terraform-azurerm-monitor_query_alert | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abv_location"></a> [abv\_location](#input\_abv\_location) | Abbreviated location (Example, wus2, eus2, etc...). It should match the location variable region. | `string` | n/a | yes |
| <a name="input_action_groups"></a> [action\_groups](#input\_action\_groups) | Action Group Info to provision the needed Action Group resources | `any` | n/a | yes |
| <a name="input_activity_alerts"></a> [activity\_alerts](#input\_activity\_alerts) | Activity alert Info to provision the needed activity log alert resources | `any` | `null` | no |
| <a name="input_code"></a> [code](#input\_code) | An optional code to be used if additional distinction is needed. It is primarily used in the naming of resources. | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | Envionment selector. (prd, uat, qa, dev). | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | This is the abbreviated version of the environment where resources will be provisioned.  This is commonly used in names of resources. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...). | `string` | n/a | yes |
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | Metric alert Info to provision the needed metric alert resources | `any` | `null` | no |
| <a name="input_project_index"></a> [project\_index](#input\_project\_index) | Project index value for use in various resources/modules, primarily used in naming. | `string` | `"01"` | no |
| <a name="input_query_alerts"></a> [query\_alerts](#input\_query\_alerts) | Query alert Info to provision the needed query alert resources | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group where the resources will be created under. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The service is a distinction primarily used in the naming of the resources. This is generally based on the module or super module naming. | `string` | `"net"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the resource(s) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_id"></a> [action\_group\_id](#output\_action\_group\_id) | Action Group ID |
| <a name="output_action_group_name"></a> [action\_group\_name](#output\_action\_group\_name) | Action Group Name |
| <a name="output_activity_alert_id"></a> [activity\_alert\_id](#output\_activity\_alert\_id) | Alert ID |
| <a name="output_activity_alert_name"></a> [activity\_alert\_name](#output\_activity\_alert\_name) | Alert Name |
| <a name="output_metric_alert_id"></a> [metric\_alert\_id](#output\_metric\_alert\_id) | Alert ID |
| <a name="output_metric_alert_name"></a> [metric\_alert\_name](#output\_metric\_alert\_name) | Alert Name |
| <a name="output_query_alert_id"></a> [query\_alert\_id](#output\_query\_alert\_id) | Alert ID |
| <a name="output_query_alert_name"></a> [query\_alert\_name](#output\_query\_alert\_name) | Alert Name |


## Example
```
module "enterprise_monitoring" {
  source = "./terraform-azurerm-enterprise_monitoring_observability"

  env_name      = "poc"
  abv_location  = "eus2"
  env           = "poc"
  location      = "eastus2"
  service       = "cw"
  project_index = "01"
  code          = "mo"
  tags          = {}

  resource_group_name = "rg-contractualwork"
  action_groups = {
    cfi_tier1 = {
      email_receiver = [
        {
          name          = "Umar_Khan_Email"
          email_address = "umar.khan@thecloudmania.com"
        },
        {
          name          = "Muhammad_Awais_Email"
          email_address = "muhammad.awais@thecloudmania.com"
        }
      ]

      sms_receiver     = []
      webhook_receiver = []
    }
  }

  query_alerts = {
    config_server_logs_dev = {
      action_group_name = "cfi_tier1"
      info = {
        scopes                                   = "/subscriptions/33db2cec-3605-467d-8216-742b23f46591/resourceGroups/rg-container-apps-poc/providers/Microsoft.OperationalInsights/workspaces/workspacergcontainerappspoc983a"
        description                              = "Log Example Test"
        enabled                                  = true
        auto_mitigation_enabled                  = false
        skip_query_validation                    = true
        query                                    = <<QUERY
          ContainerAppConsoleLogs_CL | where Log_s contains "AZ-DEV"
        QUERY
        severity                                 = 3
        evaluation_frequency                     = "PT1M"
        window_duration                          = "PT1M"
        threshold                                = 0
        operator                                 = "GreaterThan"
        time_aggregation_method                  = "Count"
        metric_measure_column                    = null
        minimum_failing_periods_to_trigger_alert = 1
        number_of_evaluation_periods             = 1
        target_resource_types                    = ["Microsoft.OperationalInsights/workspaces"]
      }
    }
  }
  
  metric_alerts = {
    vm_umar_01_cpu_percentage = {
      action_group_name = "cfi_tier1"
      info = {
        description              = "vm-umar-01 CPU alert"
        enabled                  = true
        auto_mitigate            = true
        skip_metric_validation   = true
        severity                 = "2"
        frequency                = "PT1M"
        window_size              = "PT5M"
        metric_namespace         = "Microsoft.Compute/virtualMachines"
        metric_name              = "Percentage CPU"
        aggregation              = "Average"
        operator                 = "GreaterThan"
        threshold                = "75"
        scopes                   = "/subscriptions/33db2cec-3605-467d-8216-742b23f46591/resourceGroups/rg-contractualwork/providers/Microsoft.Compute/virtualMachines/vm-umar-01"
        target_resource_type     = "Microsoft.Compute/virtualMachines"
        target_resource_location = "eastus2"
      }
    }
  }
  activity_alerts = {
    vm_umar_01_stop_vm = {
      action_group_name = "cfi_tier1"
      info = {
        description        = "vm-umar-01 has been stopped"
        category           = "Administrative"
        operation_name     = "Microsoft.Compute/virtualMachines/deallocate/action"
        status             = "Succeeded"
        webhook_properties = {}
        level              = "Informational"
        scopes             = "/subscriptions/33db2cec-3605-467d-8216-742b23f46591/resourceGroups/rg-contractualwork/providers/Microsoft.Compute/virtualMachines/vm-umar-01"
      }
    }
    vm_umar_01_start_vm = {
      action_group_name = "cfi_tier1"
      info = {
        description        = "vm-umar-01 has been started"
        category           = "Administrative"
        operation_name     = "Microsoft.Compute/virtualMachines/start/action"
        status             = "Succeeded"
        webhook_properties = {}
        level              = "Informational"
        scopes             = "/subscriptions/33db2cec-3605-467d-8216-742b23f46591/resourceGroups/rg-contractualwork/providers/Microsoft.Compute/virtualMachines/vm-umar-01"
      }
    }
  }
}

```