# Disable talk
class cis::cis_benchmarks::r217 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-talk':
    command => 'chkconfig talk off',
    onlyif => 'chkconfig --list | grep talk | grep on'
  }

}
