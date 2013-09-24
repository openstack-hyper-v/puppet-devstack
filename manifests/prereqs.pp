class devstack::prereqs{
  $prereq = ["python-setuptools",
              "build-essential",
              "python-dev",
              "libxml2-dev",
              "libxslt-dev",
              "bridge-utils",
              "python-keyring",
              "python-numpy",
              "git",
              "git-review",
             ]
  package { $prereq: ensure => installed, }
}

