output "id" {
  description = "ID of Metric Log Alert"
  value       = azurerm_monitor_metric_alert.mod_metric_alert.id
}

output "name" {
  description = "Name of Metric Log Alert"
  value       = azurerm_monitor_metric_alert.mod_metric_alert.name
}
