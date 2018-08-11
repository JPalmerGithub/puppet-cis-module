# Disable tftp
class cis::cis_benchmarks::r219 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-tftp':
    command => 'chkconfig tftp off',
    onlyif => 'chkconfig --list | grep tftp | grep on'
  }

}
