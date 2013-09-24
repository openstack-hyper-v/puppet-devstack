class devstack (
    $devstack_dir = $devstack::config::devstack_dir
    $devstack_src = $devstack::config::devstack_dir
){
  package { "git":
          ensure => installed,
  }
  exec { "git_clone_devstack":
          command => "git clone ${"devstack_src"}"
          cwd     => $devstack_dir,
          creates => $devstack_dir,
          require => Package["git"],
  }
  exec { "stackdotsh":
          command => "$devstack_dir/stack.sh",
          require => File["localrc"],
  }
}
