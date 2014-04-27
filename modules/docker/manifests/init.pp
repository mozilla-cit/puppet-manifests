include apt
class docker::update {
    exec { 'apt-get update':
      command => "/usr/bin/apt-get update",
    }
}
class { apt::release:
    release_id => 'precise',
}

class docker::install {

    apt::source { 'docker_repo':
        location   => 'https://get.docker.io/ubuntu',
        repos      => 'docker main', 
        key_server => 'keyserver.ubuntu.com',
        key        =>  'A88D21E9',
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
