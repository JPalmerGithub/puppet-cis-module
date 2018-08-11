# Disable echo
class cis::cis_benchmarks::r214 {

  exec { 'disable-echo':
    path => [ '/bin', '/sbin' ],
    command => 'chkconfig echo-dgram off && chkconfig echo-stream off',
    user => 'root',
    onlyif => 'chkconfig --list | grep echo-dgram | grep on || chkconfig --list | grep echo-stream | grep on'
  }

}
