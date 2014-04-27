include apt
class docker::update {
    exec { 'apt-get update':
      command => "/usr/bin/apt-get update",
    }
}
class docker::install {

    apt::key { 'docker_key':
        key_server => 'keyserver.ubuntu.com',
        key        =>  'A88D21E9',
    }
    exec { 'add docker repo':
        command => "/bin/sh -c \"echo deb https://get.docker.io/ubuntu docker main\
        > /etc/apt/sources.list.d/docker.list\""
    }
    package { "linux-image-generic-lts-raring":
        ensure => present,
    }
    package { "linux-headers-generic-lts-raring":
        ensure => present,
    }
    package { "lxc-docker":
        ensure  => present,
    }
}
