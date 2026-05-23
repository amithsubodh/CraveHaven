terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# NETWORK
resource "docker_network" "app_network" {
  name = "tf-network"
}

# MYSQL
resource "docker_container" "mysql" {
  name  = "tf-mysql"
  image = "mysql:8"

  env = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=cravehaven"
  ]

  ports {
    internal = 3306
    external = 3307
  }

  volumes {
    host_path      = "/Users/amithsubodh/Documents/CraveHaven/CraveHaven/server/init-db/dbms.sql"
    container_path = "/docker-entrypoint-initdb.d/dbms.sql"
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# BACKEND
resource "docker_container" "backend" {
  name  = "tf-backend"
  image = "backend"

  ports {
    internal = 3001
    external = 3001
  }

  env = [
    "DB_HOST=tf-mysql",
    "DB_USER=root",
    "DB_PASSWORD=root",
    "DB_DIALECT=mysql",
    "DB_NAME=cravehaven"
  ]

  restart = "always"

  depends_on = [docker_container.mysql]

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# FRONTEND
resource "docker_container" "frontend" {
  name  = "tf-frontend"
  image = "frontend"

  ports {
    internal = 80
    external = 3000
  }

  depends_on = [docker_container.backend]

  networks_advanced {
    name = docker_network.app_network.name
  }
}