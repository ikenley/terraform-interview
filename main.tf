# ------------------------------------------------------------------------------
# Create three RDS instances
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.14"

  backend "s3" {
    profile = "terraform-dev"
    region  = "us-east-1"
    bucket  = "924586450630-terraform-state"
    key     = "terraform-interview/terraform.tfstate"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform-dev"
}

resource "aws_db_subnet_group" "this" {
  name = "demo-subnet-group"

  subnet_ids = ["subnet-096820ec1fa83d3c0", "subnet-0dbb11e63ec5c7dfa"]
}

resource "aws_db_instance" "foo" {
  identifier           = "foo"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "14.2"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "user_foo"
  password             = "password_foo"
  parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.this.id
}

resource "aws_db_instance" "bar" {
  identifier           = "bar"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "14.2"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "user_bar"
  password             = "password_bar"
  parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.this.id
}

resource "aws_db_instance" "baz" {
  identifier           = "baz"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "14.2"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "user_baz"
  password             = "password_baz"
  parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.this.id
}
