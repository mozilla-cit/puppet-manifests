class nginx  {
	yumrepo { "nginx":
		baseurl => 	'http://nginx.org/packages/centos/6/x86_64/',
		descr   =>	'nginx',
		enabled =>	1,
		gpgcheck =>	0
	}

	package { "nginx":
		ensure	=>	latest
	}

	file { 'nginx.conf':
		path	=>	'/etc/nginx/nginx.conf',
		ensure	=>	file,
		require	=> Package['nginx'],
		source	=>	'/root/puppet-manifests/resource/nginx.conf'
	}
	service { 'nginx':
		name	=>	'nginx',
		ensure	=>	running,
		enable	=>	true,
		subscribe => File['nginx.conf']
	}

}

