class users::list {
#TODO: DRY on group really being $name

  $defaultgroups = ['users']
  $admingroups = ['admin', 'sudo']

  @account { 'tad':
    group => 'tad',
    fullname => 'Tom Farrow',
    ingroups => $admingroups,
    authorizedkey => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+CplsmiLlLzv432y5FD4vQugqsE65pTCcqRIledrLgtsHrLyG8A/aeUhN+lYMSyRZF1yvJgYzxHCct5bDide78G46mFG0al1U082+tSPAnkexP/DKFCDuVZSeuuvpD4W+zxxdhPTGoshcoMw7862m5vstMUCcJoSBXrqBZ2zmnmKWM0HoNGuPjQDrebaUd6fNKcGT5YfSB+ItJAN3wGNdLNG3GzN7NN7xhmH59GaAfPXYzRBq5Oees0c87qHphTiHzUzKP1X9sY39aqy6wGccNjhK2g6Jee2LYSyUcQL8C5gEsag3aA3PAj4hzM/9DyjiIsD79p/IukAnL/woJS8V',
    keycomment => 'tom@mozilla.org.uk',
    password   => '$1$6ebKVAQX$tPQZnnH6VvrzFCHqxIWVQ0',
  }

  @account { 'will':
    group => 'will',
    fullname => 'Will Downling',
    ingroups => $admingroups,
    authorizedkey => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1lUxc5o+SQnSAw5j61GYBQWajOwiUxVj/GxqnfT+h7bnaYlmDuKQttR4z0OlZ1zBjsLY+u/EG/88XriBlGWFGGjri0cwCAS/SjsgBTvx2Jb6IxqJkfFuXUETF0c874IHZM0wzTZ1C2cNWo4QSfbqC94V0Azcg5tP6cJhK0+ln+coBPTHghEiZZBkfPDOaniugPoOM61zvpTo1q/c2ZnUT3Luti4/ud4dr1SnugUrqIx3SeHE8w83cjcSazqdI5lc9uzqOX+OjpWOtb8H7RXmiODGxGG9hBZSjyneKanWa4ROnLPyDOTVY0ecTklF+sbIVaWmZ+DIW9JUUB+jzbPyH',
    keycomment => 'will@skym',
    password   => '$1$6ebKVAQX$tPQZnnH6VvrzFCHqxIWVQ0',

  }


  @account { 'passwdtest'
    group => 'passwdtest'
    fullname => 'passwdtest'
    authorizedkey => 'Bob'
    keycomment => 'STEVE'
    }

  #@account { 'root':
  #  group => 'root',
  #  fullname => 'ubuntu',
  #  ingroups => $admingroups,
  #  authorizedkey => '',
  #  keycomment => '',
  #}
  }
