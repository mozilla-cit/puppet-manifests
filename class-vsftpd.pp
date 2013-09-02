class vsftpd {

	package { "vsftpd":
		ensure	=>	latest
	}

	file { 'vsftpd.conf':
		path	=>	'/etc/vsftpd/vsftpd.conf',
		ensure	=>	file,
		require	=> Package['vsftpd'],
		source	=>	'/root/puppet-manifests/resource/vsftpd.conf'
	}

	service { 'vsftpd':
		name	=>	'vsftpd',
		ensure	=>	running,
		enable	=>	true,
		subscribe => File['vsftpd.conf']
	}

}