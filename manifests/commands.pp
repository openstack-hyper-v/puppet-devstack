class devstack::commands (
   $stacksrc = $devstack::stacksrc,
){
  exec {"stack.sh":
        command     => "${stacksrc}/stack.sh",
        creates     => $stackdest,
        cwd         => $stacksrc,
        require     => Gitbuild["devstack"],
        timeout     => 0,
        refreshonly => true,
  }
}
