class nginx  {
  yumrepo { 'nginx':
    baseurl  => 'http://nginx.org/packages/centos/6/x86_64/',
    descr    => 'nginx',
    enabled  => 1,
    gpgcheck => 0
  }

  package { 'nginx':
    ensure => latest
  }

  file { 'discourse.conf':
    ensure  => file,
    path    => '/etc/nginx/conf.d/discourse.conf',
    require => Package['nginx'],
    source  => 'puppet:///modules/nginx/resources/discourse.conf'
  }
  service { 'nginx':
    ensure    => running,
    name      => 'nginx',
    enable    => true,
    subscribe => File['nginx.conf']
  }

}

