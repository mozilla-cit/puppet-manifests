    class { 'sudo': }

    sudo::conf { 'wheel':
      priority => 10,
      content  => "%wheel ALL=(ALL) NOPASSWD: ALL\n",
    }