# Disable avahi
class cis::cis_benchmarks::r223 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-avahi':
    command => 'chkconfig avahi-daemon off',
    onlyif => 'chkconfig --list | grep avahi-daemon | grep on'
  }

}
