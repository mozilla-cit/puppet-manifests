class monitoring_server {
  # Install xinetd
  package { 'xinetd':
    ensure => installed,
  }

  # Install check_mk agent reccomendations
  package { 'ethtool':
    ensure => installed,
  }

  package { 'smartmontools':
    ensure => installed,
  }

  # Install Nagios -- required for check_mk
  package { 'nagios3':
    ensure => installed,
  }

  service { 'nagios':
    ensure  => running,
    require => Package['nagios3'],
  }

  # Install check_mk server
  package { 'check-mk-server':
    ensure  => installed,
    require => Service['nagios'],
  }
