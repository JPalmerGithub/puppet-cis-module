# Disable cups
class cis::cis_benchmarks::r224 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-cups':
    command => 'chkconfig cups off',
    onlyif => 'chkconfig --list | grep cups | grep on'
  }

}
