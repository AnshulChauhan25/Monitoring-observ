output "id" {
  description = "ID of Activity Log Alert"
  value       = azurerm_monitor_activity_log_alert.mod_activity_alert.id
}

output "name" {
  description = "Name of Activity Log Alert"
  value       = azurerm_monitor_activity_log_alert.mod_activity_alert.name
}
