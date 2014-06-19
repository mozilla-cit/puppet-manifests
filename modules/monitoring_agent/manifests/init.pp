# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Installs OMD for Ubuntu 12.04
# Installs xinetd, check-mk agent and configures

class monitoring_agent {
  exec { 'gpg_receive':
    command => 'gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7',
    path    => ['/usr/bin', '/bin'],
  } 

  exec { 'gpg_add':
    command => 'gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -',
    path    => ['/usr/bin', '/bin'],
    require => Exec['gpg_receive']
  } 

  exec { 'sources':
    command => 'echo "deb http://labs.consol.de/repo/stable/ubuntu precise main" >> /etc/apt/sources.list',
    path    => ['/usr/bin', '/bin'],
    require => Exec['gpg_add']
  } 

  exec { 'update':
    command => 'apt-get update',
    path    => ['/usr/bin', '/bin'],
    require => Exec['sources']
  } 

  exec { 'install':
    command => 'apt-get install -y omd',
    path    => ['/usr/bin', '/bin'],
    require => Exec['update']
  } 

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

  # Install check_mk agent
  package { 'check-mk-agent':
    ensure => installed,
  }
}
