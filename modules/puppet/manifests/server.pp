# Class: puppet::server
#
#
class puppet::server {
  package { "puppetmaster":
  	ensure => 3.6.2,
  	require => Apt::Source['puppetlabs']
  }
}