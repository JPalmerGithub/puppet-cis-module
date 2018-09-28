# Ensure permissions on /etc/gshadow- are configured
class cis::cis_benchmarks::r619 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }
  
  exec { '/etc/gshadow-_permission':
    command => 'chmod 600 /etc/gshadow-',
    onlyif => 'test ! $(/bin/stat -c %a /etc/gshadow-) = 600',
    #require => File['/etc/security/pwquality.conf'],
  }

}
