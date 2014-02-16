# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#Make sure that the SSHd defined in params.pp as ssh_package_name is installed
class ssh::install {
  include ssh::params
  package { $ssh::params::ssh_package_name:
    ensure => present,
  }
}
