# Disable telnet
class cis::cis_benchmarks::r218 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-telnet':
    command => 'chkconfig telnet off',
    onlyif => 'chkconfig --list | grep telnet | grep on'
  }

}
