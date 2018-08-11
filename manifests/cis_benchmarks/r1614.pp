# Remove SETroubleshoot
class cis::cis_benchmarks::r1614 {

  package { 'setroubleshoot':
    ensure => absent
  }

}
