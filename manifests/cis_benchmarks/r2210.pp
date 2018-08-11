# Disable HTTP server
class cis::cis_benchmarks::r2210 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-httpd':
    command => 'chkconfig httpd off',
    onlyif => 'chkconfig --list | grep httpd | grep on'
  }

}
