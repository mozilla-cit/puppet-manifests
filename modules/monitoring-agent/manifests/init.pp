# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Class: monitoring-agent
# Installes xinetd, check-mk agent and configures
#
class monitoring-agent {
	# Install xinetd
	package { "xinetd":
		ensure => installed,
	}

	# Install check_mk agent reccomendations
	package { "ethtool":
		ensure => installed,
	}

	package { "smartmontools":
		ensure => installed,
	}

	# Install check_mk agent
	package { "check-mk-agent ":
		ensure => installed,
	}

	include monitoring-agent::config,
}