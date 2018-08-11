# Disable discard
class cis::cis_benchmarks::r213 {

  exec { 'disable-discard':
    path => [ '/bin', '/sbin' ],
    command => 'chkconfig discard-dgram off && chkconfig discard-stream off',
    user => 'root',
    onlyif => 'chkconfig --list | grep discard-dgram | grep on || chkconfig --list | grep discard-stream | grep on'
  }

}
