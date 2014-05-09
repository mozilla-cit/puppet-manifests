include apt

# Installs Docker
class docker::install {
  apt::key { 'docker_key':
    key_server => 'keyserver.ubuntu.com',
    key        =>  'A88D21E9',
  }

  exec { 'add docker repo':
    provider => shell,
    command  => 'echo deb https://get.docker.io/ubuntu docker main\
      > /etc/apt/sources.list.d/docker.list'
  }

  package { 'linux-image-generic-lts-raring':
    ensure => present,
  }

  package { 'linux-headers-generic-lts-raring':
    ensure => present,
  }

  package { 'lxc-docker':
    ensure => present,
  }
}
