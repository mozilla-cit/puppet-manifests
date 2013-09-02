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
	file { 'nginx.repo':
		path   => 	'/etc/yum.repos.d/nginx.repo',
		ensure => 	file,
		source =>	'/root/puppet-manifests/resource/nginx.repo'
	}
	service { 'nginx':
		name	=>	'nginx',
		ensure	=>	running,
		enable	=>	true,
		subscribe => File['nginx.conf']
	}

}

