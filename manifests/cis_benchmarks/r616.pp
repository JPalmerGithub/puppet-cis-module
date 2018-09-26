# Ensure permissions on /etc/passwd- are configured
class cis::cis_benchmarks::r616 {

  exec { '/etc/passwd-_permission':
    command => '/bin/chmod 600 /etc/passwd-',
    onlyif => '/bin/test ! $(/bin/stat -c %a /etc/passwd-) = 600',
    require => File['/etc/security/pwquality.conf'],
  }
}
