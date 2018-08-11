# Ensure default user umask is 027 or more restrictive
class cis::cis_benchmarks::r544 {

  exec { 'set-umask-bashrc':
    path => '/bin',
    command => "sed -i 's/umask 0[[:digit:]]*/umask 027/' /etc/bashrc",
    user => 'root',
    unless => "grep 'umask 027' /etc/bashrc"
  }

  exec { 'set-umask-profile':
    path => '/bin',
    command => "sed -i 's/umask 0[[:digit:]]*/umask 027/' /etc/profile",
    user => 'root',
    unless => "grep 'umask 027' /etc/profile"
  }



}
