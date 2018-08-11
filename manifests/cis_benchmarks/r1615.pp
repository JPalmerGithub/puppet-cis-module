# Remove mcstrans
class cis::cis_benchmarks::r1615 {

  package { 'mcstrans':
    ensure => absent
  }

}
