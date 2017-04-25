output "allspark_data" {
  value = {
    resource_group_name = "${azurerm_sql_server.sql_server.resource_group_name}"
    sql_admin_username = "${var.admin_username}"
    sql_admin_password = "${var.admin_password}"
    db_ids = ["${azurerm_sql_database.sql_db.*.id}"]
  }
}
