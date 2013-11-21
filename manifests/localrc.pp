class devstack::localrc { 
    file {"localrc-multinode":
    ensure  => file,
    path    => "${devstack::stackroot}/devstack/localrc-multinode",
    content => template("devstack/localrc.multinode.erb"),
    require => Gitbuild["devstack"], 
  }
    file {"localrc-quantum":
    ensure  => file,
    path    => "${devstack::stackroot}/devstack/localrc-quantum",
    content => template("devstack/localrc.quantum.erb"),
    require => Gitbuild["devstack"], 
  }
    file {"localrc-ironic":
    ensure  => file,
    path    => "${devstack::stackroot}/devstack/localrc-ironic",
    content => template("devstack/localrc.ironic.erb"),
    require => Gitbuild["devstack"], 
  }
}

