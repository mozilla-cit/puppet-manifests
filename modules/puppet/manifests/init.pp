# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class puppet {
include apt

  # Specifies source information for Puppet
  apt::source { 'puppetlabs':
    location   => 'https://apt.puppetlabs.com',
    repos      => 'main dependencies',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  # Installs Puppet 3.6.2 from the specified apt source
  package { 'puppet-common':
    ensure  => "3.6.2-1puppetlabs1",
    require => Apt::Source['puppetlabs']
  }

  # Places the configuration file
  file { '/etc/puppet/puppet.conf':
    ensure => present,
    source => $::fqdn ? {
      'csa-puppet1.fqdn' => 'puppet:///modules/puppet/master.conf',
      default => 'puppet:///modules/puppet/agent.conf'
  }
}
