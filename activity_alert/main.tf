resource "azurerm_monitor_activity_log_alert" "mod_activity_alert" {

  name                = length(var.code) > 0 ? lower("activity-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.code}-${var.name}") : lower("activity-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.name}")
  resource_group_name = var.resource_group_name
  scopes              = [var.activity_log_alerts["scopes"]]
  description         = var.activity_log_alerts["description"]

  criteria {
    operation_name = var.activity_log_alerts["operation_name"]
    category       = var.activity_log_alerts["category"]
    status         = var.activity_log_alerts["status"]
    level          = var.activity_log_alerts["level"]

    dynamic "service_health" {
      for_each = try(var.activity_log_alerts["service_health_metrics"], [])
      content {
        events    = service_health.value["events"]
        locations = service_health.value["locations"]
        services  = service_health.value["services"]
      }
    }
  }

  action {
    action_group_id    = var.action_group
    webhook_properties = var.activity_log_alerts["webhook_properties"]
  }

  tags = var.tags

}
