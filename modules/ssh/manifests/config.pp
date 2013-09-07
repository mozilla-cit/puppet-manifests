#################################################
# SSHD Config pp file
#################################################
class ssh::config {

  file { $ssh::params::ssh_service_conf:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('ssh/sshd_config.erb');
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }
}

