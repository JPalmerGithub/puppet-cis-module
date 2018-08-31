# Setup hosts.deny
# 3.4.4 and 3.4.5
class cis::cis_benchmarks::r343 {

  file { 'hosts_allow':
    path => "/etc/hosts.allow",
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => "ALL : ALL",
  }

  file { 'hosts_deny':
    path => "/etc/hosts.deny",
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => "ALL: ALL",
  }

}
