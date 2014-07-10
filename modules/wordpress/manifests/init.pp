# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class wordpress {

  import nginx

  file { '/var/www':
    ensure  => directory,
  }

  # Pull WordPress zip from master
  file { '/var/www/wordpress-3.9.1.zip':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/wordpress-3.9.1.zip',
    require => File['/var/www'],
  }

  # Extract WordPress
  exec { 'wp':
    command => 'unzip /var/www/wordpress-3.9.1.zip -d /var/www',
    require => File['/var/www/wordpress-3.9.1.zip'],
  }

  # Tanner needs to help me undertand if this is still valid.
  file { '/mnt/wpmu/wp-content':
    ensure  => link,
    source  => '/var/www/wordpress/wp-content',
    require => Exec['wp'],
  }

  # Domain Mapping config
  file { '/var/www/wordpress/wp-content/sunrise.php':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/sunrise.php',
    require => Exec['wp'],
  }

  # nginx config
  file { '/etc/nginx/sites-enabled':
    ensure  => directory,
  }

  file { '/etc/nginx/sites-enabled/wordpress.conf':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/wordpress.conf',
    require => File['/etc/nginx/sites-enabled'],
  }

  # Pull the plugins
  file { '/var/www/wordpress/wp-content/plugins':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/wordpress/plugins',
    require => Exec['wp'],
  }

  # Pull the themes
  file { '/var/www/wordpress/wp-content/themes':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/wordpress/themes',
    require => Exec['wp'],
  }
}
