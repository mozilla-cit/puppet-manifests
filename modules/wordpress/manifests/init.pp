# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class wordpress {

  import nginx

  file { '/var/www':
    ensure  => directory,
  }

  file { '/var/www/wordpress-3.9.1.zip':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/wordpress-3.9.1.zip',
    require => File['/var/www'],
  }

  exec { 'wp':
    command => 'unzip /var/www/wordpress-3.9.1.zip -d /var/www',
    require => File['/var/www/wordpress-3.9.1.zip'],
  }

  file { '/mnt/wpmu/wp-content':
    ensure  => link,
    source  => '/var/www/wordpress/wp-content',
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

  file { '/etc/nginx/sites-enabled/wordpress.conf':
    ensure  => present,
    source  => 'puppet:///modules/wordpress/wordpress.conf',
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
