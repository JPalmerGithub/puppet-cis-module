# Disable daytime
class cis::cis_benchmarks::r212 {

  exec { 'disable-daytime':
    path => [ '/bin', '/sbin' ],
    command => 'chkconfig daytime-dgram off && chkconfig daytime-stream off',
    user => 'root',
    onlyif => 'chkconfig --list | grep daytime-dgram | grep on || chkconfig --list | grep daytime-stream | grep on'
  }

}
