resource "aws_db_instance" "prometheus" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "11"
  instance_class    = "db.t2.micro"
  name              = "prometheus"
  username          = "prometheus"
  password          = "${random_string.prometheus_database_password.result}"

  skip_final_snapshot = true
}

resource "random_string" "prometheus_database_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "prometheus_database_password" {
  name_prefix = "prometheus/database_password"
}

resource "aws_secretsmanager_secret_version" "prometheus_database_password" {
  secret_id     = "${aws_secretsmanager_secret.prometheus_database_password.id}"
  secret_string = "${random_string.prometheus_database_password.result}"
}
