class devstack::interfaces { 
    file {"interfaces-multinode":
    ensure  => file,
    path    => "/etc/network/interfaces-multinode",
    content => template("devstack/interfaces.multinode.erb"),
    require => Gitbuild["devstack"], 
  }
    file {"interfaces-quantum":
    ensure  => file,
    path    => "/etc/network/interfaces-quantum",
    content => template("devstack/interfaces.quantum.erb"),
    require => Gitbuild["devstack"], 
  }
}

