# copy a remote file to /etc/sudoers
file { "/etc/sudoers":
    mode => 440,
    owner => root,
    group => root,
    source => "puppet:///modules/sudo/sudoers"
}
