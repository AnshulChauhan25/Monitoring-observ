output "action_group_name" {
  description = "Action Group Name"
  value       = { for k, v in module.action_groups : k => v.name }
}

output "action_group_id" {
  description = "Action Group ID"
  value       = { for k, v in module.action_groups : k => v.id }
}

output "query_alert_name" {
  description = "Alert Name"
  value       = module.query_alerts == null ? null : { for k, v in module.query_alerts : k => v.name }
}

output "query_alert_id" {
  description = "Alert ID"
  value       = module.query_alerts == null ? null : { for k, v in module.query_alerts : k => v.id }
}

output "activity_alert_name" {
  description = "Alert Name"
  value       = module.activity_alerts == null ? null : { for k, v in module.activity_alerts : k => v.name }
}

output "activity_alert_id" {
  description = "Alert ID"
  value       = module.activity_alerts == null ? null : { for k, v in module.activity_alerts : k => v.id }
}

output "metric_alert_name" {
  description = "Alert Name"
  value       = module.metric_alerts == null ? null : { for k, v in module.metric_alerts : k => v.name }
}

output "metric_alert_id" {
  description = "Alert ID"
  value       = module.metric_alerts == null ? null : { for k, v in module.metric_alerts : k => v.id }
}
