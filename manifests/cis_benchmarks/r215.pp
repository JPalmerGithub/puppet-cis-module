# Disable time
class cis::cis_benchmarks::r215 {

  exec { 'disable-time':
    path => [ '/bin', '/sbin' ],
    command => 'chkconfig time-dgram off && chkconfig time-stream off',
    user => 'root',
    onlyif => 'chkconfig --list | grep time-dgram | grep on || chkconfig --list | grep time-stream | grep on'
  }

}
