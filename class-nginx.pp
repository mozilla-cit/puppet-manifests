class nginx  {

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

