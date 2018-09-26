# Install Iptables
class cis::cis_benchmarks::r361 {

  package { 'iptables':
    ensure => installed
  }

  service { 'iptables':
    ensure              => running,
    name                => iptables,
    enable              => true,
  }

  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    package { 'iptables-services':
      ensure => installed
    }
  }

}
