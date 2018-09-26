# Ensure permissions on /etc/gshadow are configured
class cis::cis_benchmarks::r615 {

  exec { '/etc/gshadow_permission':
    command => '/bin/chmod 0000 /etc/gshadow',
    onlyif => '/bin/test ! $(/bin/stat -c %a /etc/gshadow) = 0',
  }
}
