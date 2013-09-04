class base {

  package { 'sudo':
    ensure => latest
  }

  file { 'sudoers':
    ensure  => file,
    path    => '/etc/sudoers',
    require => Package['sudo'],
    source  => '/etc/sudoers'
  }

  package { 'zsh':
    ensure => latest
  }

  package { 'tcsh':
    ensure => latest
  }

}
