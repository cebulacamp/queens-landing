job "cebula_landing" {
  datacenters = ["dc1"]

  group "cebula_landing" {
    count = 1

    task "cebula_landing" {
      driver = "docker"

      config {
        image = "allgreed/queens-landing:preview5"
        port_map = {
            http = 80
        }
      }

      resources {
        cpu    = 100
        memory = 100

        network {
            port "http" {
                static = "7000"
            }
        }
      }
    }
  }
}
