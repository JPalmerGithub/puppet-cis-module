# Disable NIS Server
class cis::cis_benchmarks::r2216 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-ypserv':
    command => 'chkconfig ypserv off',
    onlyif => 'chkconfig --list | grep ypserv | grep on'
  }

}
