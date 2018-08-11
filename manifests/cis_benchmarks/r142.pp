# Single User Mode Authentication
class cis::cis_benchmarks::r142 {

  exec { 'single-user-auth':
    path => [ '/bin' ],
    command => "sed -i 's/SINGLE=[^ ]*/SINGLE=\\/sbin\\/sulogin/' /etc/sysconfig/init",
    user => 'root',
    unless => 'grep ^SINGLE /etc/sysconfig/init | grep sulogin'
  }



}
