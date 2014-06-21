class users {

  user { 'ubuntu':
    ensure   => present,
    comment  => 'ubuntu',
    shell    => '/usr/sbin/nologin',
  }

}
