class devstack::config {
  $devstack_dir    => ["/srv/devstack"],
  $devstack_src    => ["https://github.com/openstack-dev/devstack.git"],
  $openstack_build => ["$openstack_build"],
}
