# Ensure permissions on /etc/passwd- are configured
class cis::cis_benchmarks::r616 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }

  exec { '/etc/passwd-_permission':
    command => 'chmod 600 /etc/passwd-',
    onlyif => 'test ! $(stat -c %a /etc/passwd-) = 600',
    #require => File['/etc/security/pwquality.conf'],
  }
}
