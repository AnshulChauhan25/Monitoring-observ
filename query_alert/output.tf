output "id" {
  description = "ID of Query Alert"
  value       = azurerm_monitor_scheduled_query_rules_alert_v2.mod_query_alert.id
}

output "name" {
  description = "Name of Query Alert"
  value       = azurerm_monitor_scheduled_query_rules_alert_v2.mod_query_alert.name
}
