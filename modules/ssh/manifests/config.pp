# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ssh::config {
  include ssh::params


# Create a file using the paramaters in params.pp at the location defined by ssh_service_conf
  file { $ssh::params::ssh_service_conf:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }
}

