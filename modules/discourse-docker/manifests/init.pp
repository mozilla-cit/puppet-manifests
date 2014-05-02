# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# Class: discourse-docker

class discourse-docker::clone { 
   # Ensure git is installed
   include git

  # clone repo
  git::repo{'discourse_docker':
  path   => '/var/docker',
  source => 'https://github.com/discourse/discourse_docker.git'
}

}



class discourse-docker::production {
  # Copy config
  include 'discourse-docker::app'

}

class discourse-docker::dev {
  # Copy config
  include 'discourse-docker::devapp'

}

class discourse-docker::setup {
# Bootstrap app
  exec { 'bootstrap Discourse':
    command => '/var/docker/launcher bootstrap app',
    timeout => 0
  }

# Start app
  exec { 'start Discourse':
    command => '/var/docker/launcher start app',
    timeout => 0
  }
}
