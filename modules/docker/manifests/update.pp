# Runs apt-get update to get the latest packages
class docker::update {
  exec { 'apt-get update':
    command => "/usr/bin/apt-get update",
  }
}
