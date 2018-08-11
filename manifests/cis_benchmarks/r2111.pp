# Disable xinetd
class cis::cis_benchmarks::r2111 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-xinetd':
    command => 'chkconfig xinetd off',
    onlyif => 'chkconfig --list | grep xinetd | grep on'
  }

}
