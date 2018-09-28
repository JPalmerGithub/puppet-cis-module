# Ensure permissions on /etc/gshadow are configured
class cis::cis_benchmarks::r615 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }

  exec { '/etc/gshadow_permission':
    command => 'chmod 0000 /etc/gshadow',
    onlyif => 'test ! $(stat -c %a /etc/gshadow) = 0',
  }
}
