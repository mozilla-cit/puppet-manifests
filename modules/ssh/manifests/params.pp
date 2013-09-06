#################################################
# SSHD params pp file
#################################################
class ssh::params {
  $ssh_package_name = 'openssh-server'
  $ssh_service_conf = '/etc/ssh/sshd_config'
  $ssh_service_name = 'ssh'
}
