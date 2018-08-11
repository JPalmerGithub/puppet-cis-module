# Disable Interactive Boot
class cis::cis_benchmarks::r143 {

  exec { 'disable-interactive-boot':
    path => [ '/bin' ],
    command => "sed -i 's/PROMPT=\\(yes\\|YES\\|Yes\\)/PROMPT=no/' /etc/sysconfig/init",
    user => 'root',
    unless => 'grep "^PROMPT=" /etc/sysconfig/init | grep no'
  }

}
