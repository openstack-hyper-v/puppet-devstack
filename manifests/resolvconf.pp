class resolvconf{
exec { "add_nameserver_resolv":
	command => "echo "nameserver 10.21.7.1 >> /etc/resolv.conf",
}
}
