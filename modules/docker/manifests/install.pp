# Installs Docker
class docker::install {
  exec { "key":
    command => "/usr/bin/wget -qO- https://get.docker.io/gpg | /usr/bin/apt-key add -",
  }

  exec { 'add_docker_repo':
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
