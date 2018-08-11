# Install TCP Wrappers
class cis::cis_benchmarks::r341 {

  package { 'tcp_wrappers':
    ensure => installed
  }

}
