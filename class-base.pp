class base {
	
	package { 'sudo':
		ensure => latest
	}

	file { 'sudoers':
		path	=>	'/etc/sudoers',
		ensure	=>	file,
		require	=>	Package['sudo'],
		source	=>	'/etc/sudoers'
	}

	package { "zsh":
		ensure	=>	latest
	}

	package { "tcsh":
		ensure	=>	latest
	}

}