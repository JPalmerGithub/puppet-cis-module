# Ensure password expiration is 90 days or less
# Ensure minimum days between password changes is 7 or more
# Ensure password expiration warning days is 7 or more

class cis::cis_benchmarks::r5411_r5413 {

  file { '/etc/login.defs':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/login.defs'
  }

}
