output "id" {
  description = "ID of action group"
  value       = azurerm_monitor_action_group.mod_action_group.id
}

output "name" {
  description = "Name of action group"
  value       = azurerm_monitor_action_group.mod_action_group.name
}
