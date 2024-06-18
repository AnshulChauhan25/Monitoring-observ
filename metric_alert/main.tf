resource "azurerm_monitor_metric_alert" "mod_metric_alert" {

  name                     = length(var.code) > 0 ? lower("metric-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.code}-${var.name}") : lower("metric-alert-${var.abv_location}-${var.env}-${var.index}-${var.service}-${var.name}")
  resource_group_name      = var.resource_group_name
  scopes                   = [var.metric_alerts["scopes"]]
  description              = var.metric_alerts["description"]
  severity                 = var.metric_alerts["severity"]
  frequency                = var.metric_alerts["frequency"]
  window_size              = var.metric_alerts["window_size"]
  auto_mitigate            = var.metric_alerts["auto_mitigate"]
  enabled                  = var.metric_alerts["enabled"]
  target_resource_type     = var.metric_alerts["target_resource_type"]
  target_resource_location = var.metric_alerts["target_resource_location"]


  criteria {
    metric_namespace       = var.metric_alerts["metric_namespace"]
    metric_name            = var.metric_alerts["metric_name"]
    aggregation            = var.metric_alerts["aggregation"]
    operator               = var.metric_alerts["operator"]
    threshold              = var.metric_alerts["threshold"]
    skip_metric_validation = var.metric_alerts["skip_metric_validation"]

  }

  action {
    action_group_id = var.action_group
  }

  tags = var.tags
}
