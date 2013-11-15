node default {
	include base
	include users
}
node webservers inherits default {
	include nginx
	include redis
}

node discourse inherits default {
  include nginx
  include redis
  include discourse
}

node database inherits default {
	include postgresql

	class { 'postgresql::server':
  config_hash => {
      'ip_mask_allow_all_users' => '10.6.0.0/15',
      'listen_addresses'        => '*',
      'manage_redhat_firewall'  => false,

      #'ip_mask_deny_postgres_user' => '0.0.0.0/32',
      #'postgres_password' => 'puppet',
  },
}

postgresql::db{ 'discourse_dev':
  user          => 'discourse_dev_user',
  password      => 'md5a05ed52d1344dcf1575b556ae9416f4a',
  grant         => 'all',
}

postgresql::db{ 'discourse_stage':
  user          => 'discourse_stage_user',
  password      => 'md53261a03c46af9ced5034c696ec76f0d5',
  grant         => 'all',
}


postgresql::db{ 'discourse_prod':
  user          => 'discourse_prod_user',
  password      => 'md51901ffbaadaa01a9c750d614dc0e03d4',
  grant         => 'all',
}

}