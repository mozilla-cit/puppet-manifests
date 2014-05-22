# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Bootstraps and starts the app
class discourse_docker::setup {
  exec { 'destroy Discourse':
    command => '/var/docker/launcher destroy app',
    timeout => 0
  }

  exec { 'bootstrap Discourse':
    command => '/var/docker/launcher bootstrap app',
    timeout => 0
  }

  exec { 'start Discourse':
    command => '/var/docker/launcher start app',
    timeout => 0
  }
}
