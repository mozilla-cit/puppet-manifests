# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class motd {
  # Creates a symlink in the /var/run directory
  file { '/etc/motd':
    ensure => link,
    target => '/var/run/motd',
  }

  # Sets file permissions and ownership for motd.tail file
  file {'/etc/motd.tail':
  ensure  => present,
  mode    => '0644',
  owner   => root,
  group   => root,
  source  => 'puppet:///modules/motd/motd'
  }
}
