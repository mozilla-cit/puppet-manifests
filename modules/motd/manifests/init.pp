file {'/etc/motd':
      ensure  => present,
      mode    => 0644,
      owner   => root,
      group   => root,
      source => "puppet:///modules/motd/motd"
    }
