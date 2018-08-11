# Install Iptables
class cis::cis_benchmarks::r361 {

  package { 'iptables':
    ensure => installed
  }

}
