# Ensure permissions on /etc/group- are configured
class cis::cis_benchmarks::r618 {

  exec { '/etc/group-_ownership':
    command => '/bin/chown root:root /etc/group-',
    onlyif => '/bin/test ! $(/bin/stat -c %U%G /etc/group-) = rootroot',
  }
  
  exec { '/etc/group-_permission':
    command => '/bin/chmod 600 /etc/group-',
    onlyif => '/bin/test ! $(/bin/stat -c %a /etc/group-) = 600',
  }

}
