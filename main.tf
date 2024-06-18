provider "azurerm" {
  features {}
}

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

    key_vaults = {
      action_group_name = "cfi_tier1"
      info = {
        description        = "service health alert for VMs"
        category           = "ServiceHealth"
        operation_name     = null
        status             = null
        webhook_properties = {}
        service_health_metrics = [
          {
            events    = ["Incident", "Maintenance"]
            locations = ["East US 2"]
            services  = ["Key Vault"]
          }
        ]
        level  = null
        scopes = "/subscriptions/33db2cec-3605-467d-8216-742b23f46591"
      }
    }
  }
}
