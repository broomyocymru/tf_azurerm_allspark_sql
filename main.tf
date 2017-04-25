resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.server_name}"
  resource_group_name          = "${var.allspark["resource_group_name"]}"
  location                     = "${var.allspark["location"]}"
  version                      = "12.0"
  administrator_login          = "${var.admin_username}"
  administrator_login_password = "${var.admin_password}"
}

resource "azurerm_sql_database" "sql_db" {
  count               = "${length(var.db_names)}"
  name                = "${element(var.db_names, count.index)}"
  resource_group_name = "${var.allspark["resource_group_name"]}"
  location            = "${var.allspark["location"]}"
  server_name         = "${azurerm_sql_server.sql_server.fully_qualified_domain_name}"
}
