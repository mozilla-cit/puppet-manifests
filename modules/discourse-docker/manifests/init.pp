# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# Class: discourse-docker

class { 'discourse-docker::clone': 
  stage => prep,
    # Ensure git is installed
  package { "git":
    ensure => installed
  },

  # clone repo
  exec { "clone discourse-docker repo":
    command => "/usr/bin/git clone https://github.com/discourse/discourse_docker.git /var/docker"
    }
}

class { 'discourse-docker::config':
    stage => main,
  # Copy config
  include 'discourse-docker::app'

}

class { 'discourse-docker::setup':
  stage => post,
# Bootstrap app
  exec { "bootstrap Discourse":
    command => '/var/docker/launcher bootstrap app'
  },

# Start app
  exec { "start Discourse":
    command => '/var/docker/launcher start app'
  }
}
