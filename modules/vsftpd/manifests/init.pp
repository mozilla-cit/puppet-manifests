class vsftpd {

  package { 'vsftpd':
    ensure => latest
  }

  file { 'vsftpd.conf':
    ensure  => file,
    path    => '/etc/vsftpd/vsftpd.conf',
    require => Package['vsftpd'],
    source  => '/root/puppet-manifests/resource/vsftpd.conf'
  }

  service { 'vsftpd':
    ensure    => running,
    name      => 'vsftpd',
    enable    => true,
    subscribe => File['vsftpd.conf']
  }

}
