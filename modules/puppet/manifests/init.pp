# Installs the latest Puppet from the apt repo
apt::source { 'puppetlabs':
  location   => 'https://apt.puppetlabs.com',
  repos      => 'main',
  key        => '4BD6EC30',
  key_server => 'pgp.mit.edu',
}

package { 'puppet':
  ensure  => latest,
  require => Apt::Source[puppetlabs]
}
