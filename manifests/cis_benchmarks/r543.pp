# Ensure default group for the root account is GID 0
class cis::cis_benchmarks::r543 {

  exec { 'set-root-gid':
    path => [ '/usr/sbin', '/bin', '/usr/bin' ],
    command => 'usermod -g 0 root',
    user => 'root',
    unless => 'grep "^root:" /etc/passwd | cut -f4 -d: | grep 0'
  }

}
