define devstack::gitbuild(
  $githome,
  $stackroot=$devstack::stackroot
){


   vcsrepo{"${stackroot}/${name}":
     ensure   => present,
     provider => 'git',
     source   => "${githome}/${name}.git",
   }
   exec { "get-${name}":
        cwd => "${stackroot}",
        creates => "${stackroot}/${name}/.git",
        command => "/usr/bin/git clone ${githome}/${name}.git",
        #before => Exec["update-${name}"],
        require     => Vcsrepo["${stackroot}/${name}"],
	refreshonly => true,
        timeout     => 0,
   }

   exec { "update-${name}":
        cwd         => "${stackroot}/${name}",
        command     => "/usr/bin/git pull ${githome}/${name}.git",
        refreshonly => true,
        timeout     => 0,
        require     => Exec["get-${name}"],
   }

   ##   exec { "install-${packagename}":
   #     cwd     => "${stackroot}/${name}",
   #     command => "python setup.py install --force",
   #     require => Exec["update-${name}"],
   #     timeout => 0,
   #}

}
