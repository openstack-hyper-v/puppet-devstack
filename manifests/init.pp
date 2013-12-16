class devstack(
   $stackroot,
   $admin_passwd
   
){

  $stacksrc       = "${stackroot}/devstack"
  $stackdest      = "${stackroot}/stack"
  $mysql_passwd   = $admin_passwd
  $rabbit_passwd  = $admin_passwd
  $service_passwd = $admin_passwd
  $path           = $::path

  $devstack_controller_ip = "10.21.7.51"
  $devstack_controller_netmask = "255.255.255.0"
  $devstack_controller_gateway = "10.21.7.254"
  $quantum_ip = "10.21.7.52"
  $quantum_netmask = $devstack_controller_netmask
  $quantum_gateway = $devstack_controller_gateway

group {'stack':
  ensure => present,
}

user { 'stack':
  ensure           => 'present',
  gid              => 'stack',
  home             => "${stackdest}",
  password         => '!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
}

file { "/etc/sudoers":
      owner   => "root",
      group   => "root",
      mode    => "440",
}

augeas { "addstacktosudoers":
  context => "/files/etc/sudoers",
  changes => [
    "set spec[user = 'stack']/user stack",
    "set spec[user = 'stack']/host_group/host ALL",
    "set spec[user = 'stack']/host_group/command ALL",
    "set spec[user = 'stack']/host_group/command/runas_user ALL",
    "set spec[user = 'stack']/host_group/command/tag NOPASSWD",
  ],
}

class {prereqs: }
class {commands: }

  gitbuild{"devstack":
    githome => "http://github.com/openstack-dev",
  }

class {localrc: }
class {interfaces: }
class {bashrc: }


}

