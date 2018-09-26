# Ensure permissions on /etc/shadow- are configured
class cis::cis_benchmarks::r617 {

  exec { '/etc/shadow-_permission':
    command => '/bin/chmod 600 /etc/shadow-',
    onlyif => '/bin/test ! $(/bin/stat -c %a /etc/shadow-) = 600',
  }

}
