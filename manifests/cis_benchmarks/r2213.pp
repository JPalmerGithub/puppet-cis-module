# Disable HTTP Proxy Server
class cis::cis_benchmarks::r2213 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-squid':
    command => 'chkconfig squid off',
    onlyif => 'chkconfig --list | grep squid | grep on'
  }

}
