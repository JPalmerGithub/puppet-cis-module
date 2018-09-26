# Ensure permissions on /etc/gshadow- are configured
class cis::cis_benchmarks::r619 {

  exec { '/etc/gshadow-_permission':
    command => '/bin/chmod 600 /etc/gshadow-',
    onlyif => '/bin/test ! $(/bin/stat -c %a /etc/gshadow-) = 600',
    require => File['/etc/security/pwquality.conf'],
  }

}
