node default {
	include base
	include users
	include nginx
}

node  { #TODO: Add hosts for each Discourse host
	include redis
}

