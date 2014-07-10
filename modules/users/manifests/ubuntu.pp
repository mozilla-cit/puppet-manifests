class users {

  # Disable login for the ubuntu user
  user { 'ubuntu':
    ensure   => present,
    comment  => 'ubuntu',
    shell    => '/usr/sbin/nologin',
  }

}
