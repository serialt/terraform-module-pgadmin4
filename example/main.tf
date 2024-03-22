module "pgadmin4" {
  source = "../"

  namespace = "default"
  web_auth = {
    email    = "admin@local.com"
    password = "111111111111111111"

  }
  servers_config = {
    server = {
      Name          = "dev"
      Group         = "Servers"
      Port          = "5432"
      Username      = "postgres"
      Host          = "127.0.0.1"
      SSLMode       = "prefer"
      MaintenanceDB = "postgres"
    }
  }
}
