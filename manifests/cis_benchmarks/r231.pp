# Uninstall NIS Client
class cis::cis_benchmarks::r231 {

  package { 'ypbind':
    ensure => absent
  }

}
