project = "hashitalks2022"

app "demo" {
    build {
        use "pack" {} 
        registry {
          use "docker" {
            image = "saiyam911/cd-demo"
            tag   = "v3"
            local = false
            username= ${{ secrets.DOCKER_USERNAME }}
            password= ${{ secrets.DOCKER_PASSWORD }}
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
