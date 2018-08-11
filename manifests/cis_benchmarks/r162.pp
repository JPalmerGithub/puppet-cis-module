# Install SELinux
class cis::cis_benchmarks::r162 {

  package { 'libselinux':
    ensure => installed
  }

}
