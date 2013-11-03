class sudo {

  package { 'sudo':
    ensure => latest
  }

  file { 'sudoers':
    ensure  => file,
    path    => '/etc/sudoers',
    require => Package['sudo'],
    source  => '/root/puppet-manifests/resources/sudo/sudoers'
  }

}
