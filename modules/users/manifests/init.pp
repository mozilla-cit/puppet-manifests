class users {
  # Include the list of users, based on list-example.pp. Stored securely on master only.
  include users::list

  # Turns the user list into a resource
  define account ($group, $fullname, $ingroups, $authorizedkey, $keycomment, $password, $keytype) {
    Group["$name"] -> User["$name"] -> Exec["$name homedir"] ->
      Ssh_authorized_key["$keycomment"]

    # Create a group for the user
    group { "$name":
      ensure => present,
    }

    # Create user using details from list
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

    # Make the home directory sexy
    exec { "$name homedir":
      command => "/bin/cp -R /etc/skel /home/$name; /bin/chown -R $name:$group /home/$name",
      creates => "/home/$name",
      require => User[$name],
    }

    # Install user's key
    ssh_authorized_key { "$keycomment":
      ensure => "present",
      type   => "$keytype",
      key    => "$authorizedkey",
      user   => "$name",
    }
  }

}
