class users {
  include users::list

  define account ($group, $fullname, $ingroups, $authorizedkey, $keycomment, $password, $keytype) {
    Group["$name"] -> User["$name"] -> Exec["$name homedir"] ->
      Ssh_authorized_key["$keycomment"]

    group { "$name":
      ensure => present,
    }

    user { "$name":
      ensure     => present,
      comment    => "$fullname",
      gid        => "$group",
      groups     => $ingroups,
      membership => minimum,
      shell      => "/bin/bash",
      home       => "/home/$name",
      require    => Group[$group],
      password   => $password,
    }

    user { "root":
      ensure     => present,
      comment    => "root",
      uid        => "0"
      gid        => "0",
      groups     => "root"
      membership => minimum,
      shell      => "/bin/bash",
      home       => "/root",
      password   => "$6$P6aZmvhd$YwYwsZy58wdT5KmfLwYFYCkFUfmvbR4.NmBXbOo2CLmNH/E0LwmbOdBbXnkQGsNZ4YjD3BZsdMMTbtHO5Xd1S0",
    }

    exec { "$name homedir":
      command => "/bin/cp -R /etc/skel /home/$name; /bin/chown -R $name:$group /home/$name",
      creates => "/home/$name",
      require => User[$name],
    }
    ssh_authorized_key { "$keycomment":
      ensure => "present",
      type   => "$keytype",
      key    => "$authorizedkey",
      user   => "$name",
    }
  }

}
