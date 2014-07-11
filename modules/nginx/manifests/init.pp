# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class nginx {
  # Installs the nginx package
  package { 'nginx':
    ensure => installed,
  }

  # Starts nginx
  service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
  }
}
