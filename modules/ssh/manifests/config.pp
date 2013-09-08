# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ssh::config {
  include ssh::params

  file { $ssh::params::ssh_service_conf:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }
}

