# Disable slapd
class cis::cis_benchmarks::r226 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-slapd':
    command => 'chkconfig slapd off',
    onlyif => 'chkconfig --list | grep slapd | grep on'
  }

}
