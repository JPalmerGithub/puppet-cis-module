# Uninstall RSH Client
class cis::cis_benchmarks::r232 {

  package { 'rsh':
    ensure => absent
  }

}
