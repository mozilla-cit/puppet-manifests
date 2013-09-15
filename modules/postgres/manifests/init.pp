class postgresql {
  package { 'postgres':
    ensure => 'latest'
  }
