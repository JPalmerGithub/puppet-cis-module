# Set TMOUT
class cis::cis_benchmarks::r545 {

  exec { 'set_tmout_profile':
    command => '/bin/echo TMOUT=600 >> /etc/profile',
    unless => '/bin/grep TMOUT=600  /etc/profile',
  }

  exec { 'set_tmout_bashrc':
    command => '/bin/echo TMOUT=600 >> /etc/bashrc',
    unless => '/bin/grep TMOUT=600  /etc/bashrc',
  }

}
