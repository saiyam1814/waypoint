project = "hashitalks2022"

variable "user" {
    type = string
}
variable "password" {
    type = string
}

app "demo" {
    build {
        use "pack" {} 
        registry {
          use "docker" {
            image = "saiyam911/cd-demo"
            tag   = "${substr(gitrefhash(), 0, 7)}-${formatdate("YYYYMMDD-hhmmss", timestamp())}"
            local = false
            username = var.user
            password = var.password
          }
        }

    }
    deploy { 
      use "kubernetes" {
          service_port = 8080
  }
    }

    release {
      use "kubernetes" {
        node_port = 31769
        port = 8080
      }
    }
}
