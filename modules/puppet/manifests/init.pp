# Installs the latest Puppet from the apt repo

class puppet {
include apt

    apt::source { 'puppetlabs':
        location   => 'https://apt.puppetlabs.com',
        repos      => 'main dependencies',
        key        => '4BD6EC30',
        key_server => 'pgp.mit.edu',
    }

    package { 'puppet-common':
        ensure  => "3.6.2-1puppetlabs1",
        require => Apt::Source['puppetlabs']
    }

    file { '/etc/puppet/puppet.conf':
        ensure => present,
        source => $::fqdn ? {
            'csa-puppet1.fqdn' => 'puppet:///modules/puppet/master.conf',
            default => 'puppet:///modules/puppet/agent.conf'
    }
}
