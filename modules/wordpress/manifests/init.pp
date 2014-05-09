# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class wordpress {
  file { '/var/www':
    ensure  => directory,
  }

  exec { 'wp':
    command => '/usr/bin/git clone https://github.com/WordPress/WordPress /var/www/wordpress',
    require => File['/var/www'],
  }

  file { '/var/www/wordpress/wp-config.php':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/wp-config.php',
    require => Exec['wp'],
  }

  file { '/var/www/wordpress/wp-content/sunrise.php':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/sunrise.php',
    require => Exec['wp'],
  }

  file { '/etc/nginx/sites-enabled':
    ensure  => directory,
  }

  file { '/etc/nginx/sites-enabled/nginx':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/nginx',
    require => File['/etc/nginx/sites-enabled'],
  }

  file { '/var/www/wordpress/wp-content/plugins':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/wordpress/plugins',
    require => Exec['wp'],
  }

  file { '/var/www/wordpress/wp-content/themes':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/wordpress/themes',
    require => Exec['wp'],
  }
}
