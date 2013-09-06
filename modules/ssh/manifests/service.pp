#################################################
# SSHD Service pp file
#################################################
class ssh::service {
  service { $ssh::params::ssh_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['ssh::config'],
  }
}
