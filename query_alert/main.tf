resource "azurerm_monitor_scheduled_query_rules_alert_v2" "mod_query_alert" {

  name                = length(var.code) > 0 ? lower("query-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.code}-${var.name}") : lower("query-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.name}")
  display_name        = length(var.code) > 0 ? lower("query-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.code}-${var.name}") : lower("query-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.name}")
  location            = var.location
  resource_group_name = var.resource_group_name

  scopes                  = [var.query_alerts["scopes"]]
  window_duration         = var.query_alerts["window_duration"]
  severity                = var.query_alerts["severity"]
  evaluation_frequency    = var.query_alerts["evaluation_frequency"]
  description             = var.query_alerts["description"]
  enabled                 = var.query_alerts["enabled"]
  auto_mitigation_enabled = var.query_alerts["auto_mitigation_enabled"]
  skip_query_validation   = var.query_alerts["skip_query_validation"]
  target_resource_types   = var.query_alerts["target_resource_types"]

  criteria {
    operator                = var.query_alerts["operator"]
    threshold               = var.query_alerts["threshold"]
    query                   = var.query_alerts["query"]
    time_aggregation_method = var.query_alerts["time_aggregation_method"]
    metric_measure_column   = var.query_alerts["metric_measure_column"]

    failing_periods {
      minimum_failing_periods_to_trigger_alert = var.query_alerts["minimum_failing_periods_to_trigger_alert"]
      number_of_evaluation_periods             = var.query_alerts["number_of_evaluation_periods"]
    }

    dynamic "dimension" {
      for_each = try(var.query_alerts["dimension"], [])
      content {
        name     = dimension.value["name"]
        operator = dimension.value["operator"]
        values   = dimension.value["values"]
      }
    }
  }

  action {
    action_groups = [var.action_group]
  }

  tags = var.tags
}
