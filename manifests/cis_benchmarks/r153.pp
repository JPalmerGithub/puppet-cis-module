# Enable ASLR
class cis::cis_benchmarks::r153 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root'
  }

  exec { 'enable-aslr':
    command => "grep -q 'kernel.randomize_va_space' /etc/sysctl.conf || echo 'kernel.randomize_va_space = 2' >> /etc/sysctl.conf",
    unless => 'sysctl kernel.randomize_va_space | grep 2',
    notify => Exec['set-aslr-active-kernel-param']
  }

  exec { 'set-aslr-active-kernel-param':
    command => 'sysctl -w kernel.randomize_va_space=2',
    refreshonly => true
  }

}
