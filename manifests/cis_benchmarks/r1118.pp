# Set sticky bit in world-writable directories
class cis::cis_benchmarks::r1118 {

  exec { 'set-sticky-bit':
    path => [ '/bin', '/usr/bin' ], 
    command => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t",
    user => 'root',
    onlyif => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d ( -perm -0002 -a ! -perm -1000 \\) 2>/dev/null | grep '/'"
  }

  file { '/tmp':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '1777'
  }

}

