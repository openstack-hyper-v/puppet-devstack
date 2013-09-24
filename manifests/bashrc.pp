class devstack::bashrc{
	file { "bashrc.devstack":
		ensure  => file,
		path    => "/opt/bashrc.devstack",
		content => template("devstack/bashrc.erb")
	}
}
	

