# Enable crond daemon
class cis::cis_benchmarks::r511 {

  service { 'crond':
    ensure => running,
    enable => true
  }

}
