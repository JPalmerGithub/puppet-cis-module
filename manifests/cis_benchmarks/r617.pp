# Ensure permissions on /etc/shadow- are configured
class cis::cis_benchmarks::r617 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }

  exec { '/etc/shadow-_permission':
    command => 'chmod 600 /etc/shadow-',
    onlyif => 'test ! $(stat -c %a /etc/shadow-) = 600',
    #require => File['/etc/security/pwquality.conf'],
  }

}
