# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class sudo {
  # Checks that the plessudo group exists
  group { 'plesssudo':
    ensure => 'present',
  }

  # Sets ownership and file permissions for the sudoers file
  file { '/etc/sudoers':
    mode   => '0440',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/sudo/sudoers'
  }
}
