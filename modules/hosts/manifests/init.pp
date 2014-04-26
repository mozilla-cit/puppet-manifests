class hosts {


host { 'csa-bastion1':
    ip => '10.0.0.6',
}

host { 'csa-bastion2':
    ip => '10.0.0.9',
}

host { 'csa-monitor1':
    ip => '10.0.0.8',
}

host { 'csa-docker1':
    ip => '10.0.0.10',
}


host { 'csa-phab-web1':
    ip => '10.0.0.12',
}

host { 'csa-phab-web2':
    ip => '10.0.0.13',
}

host { 'csa-phab-db1':
    ip => '10.0.0.14',
}
host { 'csa-wpmu-web1':
    ip => '10.0.0.15',
}

host { 'csa-wpmu-web2':
    ip => '10.0.0.19',
}

host { 'csa-wpmu-proxy2':
    ip => '10.0.0.22',
}
host { 'csa-wpmu-proxy1':
    ip => '10.0.0.23',
}

host { 'csa-discourse-web2':
    ip => '50.18.123.122',
}

host { 'csa-discourse-web1':
    ip => '50.18.123.114',
}

host { 'csa-discourse-dev':
    ip => '50.18.122.184',
}
}

# Class: hosts::local
#
#
class hosts::local {
    host { 'csa-puppet1':
    ip => '10.0.0.7',
    host_aliases => 'puppet',
}
}

# Class: hosts::external
#
#
class hosts::external {
    host { 'csa-puppet1':
    ip => '15.125.78.134',
    host_aliases => 'puppet',
}
}