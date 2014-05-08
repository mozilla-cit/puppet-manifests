# Install a custom MOTD file
class motd {
  file { '/etc/motd':
    ensure => link,
    target => '/var/run/motd',
  }

  file {'/etc/motd.tail':
  ensure  => present,
  mode    => '0644',
  owner   => root,
  group   => root,
  source  => 'puppet:///modules/motd/motd'
  }
}
