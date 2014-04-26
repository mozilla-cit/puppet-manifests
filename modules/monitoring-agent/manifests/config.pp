# Class: monitoring-agent::config
# Configures the monitoring agent.
#
class monitoring-agent::config {

	file { "/etc/xinetd.d/check_mk":
   		mode => 400,
    	owner => root,
    	group => root,
    	source => "puppet:///modules/monitoring-agent/check_mk",
    	notify  => Service["xinetd"],
	}


}