node default {
	include base
	include users
}
node webservers inherits default {
	include nginx
}
node  inherits default { #TODO: Add hosts for each Discourse host
	include redis
}

