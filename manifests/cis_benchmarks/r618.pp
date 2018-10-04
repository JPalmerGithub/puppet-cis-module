# Ensure permissions on /etc/group- are configured
class cis::cis_benchmarks::r618 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }

  exec { '/etc/group-_ownership':
    command => 'chown root:root /etc/group-',
    onlyif => 'test ! $(stat -c %U%G /etc/group-) = rootroot',
  }
  
  exec { '/etc/group-_permission':
    command => 'chmod 600 /etc/group-',
    onlyif => 'test ! $(stat -c %a /etc/group-) = 600',
    #require => File['/etc/security/pwquality.conf'],
  }

}
