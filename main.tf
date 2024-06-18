module "action_groups" {
  source   = "../terraform-azurerm-monitor_action_group"
  for_each = var.action_groups

  location            = var.location
  resource_group_name = var.resource_group_name
  index               = var.project_index
  abv_location        = var.abv_location
  env                 = var.env
  name                = each.key

  email_receiver   = each.value.email_receiver == [] ? [] : each.value.email_receiver
  sms_receiver     = each.value.sms_receiver == [] ? [] : each.value.sms_receiver
  webhook_receiver = each.value.webhook_receiver == [] ? [] : each.value.webhook_receiver

  tags = var.tags
}


module "query_alerts" {
  source   = "../terraform-azurerm-monitor_query_alert"
  for_each = var.query_alerts

  location            = var.location
  resource_group_name = var.resource_group_name
  index               = var.project_index
  abv_location        = var.abv_location
  env                 = var.env
  name                = each.key

  action_group = module.action_groups["${each.value.action_group_name}"].id
  query_alerts = each.value.info

  tags = var.tags
}

module "metric_alerts" {
  source   = "../terraform-azurerm-monitor_metric_alert"
  for_each = var.metric_alerts

  location            = var.location
  resource_group_name = var.resource_group_name
  index               = var.project_index
  abv_location        = var.abv_location
  env                 = var.env
  name                = each.key

  action_group  = module.action_groups["${each.value.action_group_name}"].id
  metric_alerts = each.value.info

  tags = var.tags
}

module "activity_alerts" {
  source   = "../terraform-azurerm-monitor_activity_alert"
  for_each = var.activity_alerts

  location            = var.location
  resource_group_name = var.resource_group_name
  index               = var.project_index
  abv_location        = var.abv_location
  env                 = var.env
  name                = each.key

  action_group        = module.action_groups["${each.value.action_group_name}"].id
  activity_log_alerts = each.value.info

  tags = var.tags
}
