class users {
  include users::list

  define account ($group, $fullname, $ingroups, $authorizedkey, $keycomment) {
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
    }

    exec { "$name homedir":
      command => "/bin/cp -R /etc/skel /home/$name; /bin/chown -R $name:$group /home/$name",
      creates => "/home/$name",
      require => User[$name],
    }
    ssh_authorized_key { "$keycomment":
      ensure => "present",
      type   => "ssh-rsa",
      key    => "$authorizedkey",
      user   => "$name",
    }
  }

}
