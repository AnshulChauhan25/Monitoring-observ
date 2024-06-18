resource "azurerm_monitor_action_group" "mod_action_group" {
  name                = length(var.code) > 0 ? lower("ag-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.code}-${var.name}") : lower("ag-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.name}")
  resource_group_name = var.resource_group_name
  short_name          = var.name

  dynamic "email_receiver" {
    for_each = var.email_receiver

    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = var.use_common_alert_schema
    }
  }

  dynamic "sms_receiver" {
    for_each = var.sms_receiver

    content {
      name         = sms_receiver.value.name
      country_code = "1"
      phone_number = sms_receiver.value.phone_number
    }
  }

  dynamic "webhook_receiver" {
    for_each = var.webhook_receiver

    content {
      name                    = webhook_receiver.value.name
      service_uri             = webhook_receiver.value.service_uri
      use_common_alert_schema = var.use_common_alert_schema
    }
  }


  dynamic "automation_runbook_receiver" {
    for_each = var.automation_runbook_receiver

    content {
      name                    = automation_runbook_receiver.value.name
      automation_account_id   = automation_runbook_receiver.value.automation_account_id
      runbook_name            = automation_runbook_receiver.value.runbook_name
      webhook_resource_id     = automation_runbook_receiver.value.webhook_resource_id
      is_global_runbook       = automation_runbook_receiver.value.is_global_runbook
      service_uri             = automation_runbook_receiver.value.service_uri
      use_common_alert_schema = var.use_common_alert_schema
    }
  }

}
