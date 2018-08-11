# Disable DNS server
class cis::cis_benchmarks::r228 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-named':
    command => 'chkconfig named off',
    onlyif => 'chkconfig --list | grep named | grep on'
  }

}
