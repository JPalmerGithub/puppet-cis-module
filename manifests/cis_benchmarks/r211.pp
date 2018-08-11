# Disable chargen
class cis::cis_benchmarks::r211 {

  exec { 'disable-chargen':
    path => [ '/bin', '/sbin' ],
    command => 'chkconfig chargen-dgram off && chkconfig chargen-stream off',
    user => 'root',
    onlyif => 'chkconfig --list | grep chargen-dgram | grep on || chkconfig --list | grep chargen-stream | grep on'
  }

}
