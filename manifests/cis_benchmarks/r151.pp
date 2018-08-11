# Restrict Core Dumps
class cis::cis_benchmarks::r151 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root'
  }

  exec { 'set-hard-limit':
    command => "sed -i '\$i* hard core 0' /etc/security/limits.conf",
    unless => 'grep "hard core" /etc/security/limits.conf',
    before => Exec['set-suid-dumpable']
  }

  exec { 'set-suid-dumpable':
    command => "grep -q 'fs.suid_dumpable' /etc/sysctl.conf || echo 'fs.suid_dumpable = 0' >> /etc/sysctl.conf",
    unless => 'sysctl fs.suid_dumpable | grep 0',
    notify => Exec['set-active-kernel-param']
  }

  exec { 'set-active-kernel-param':
    command => 'sysctl -w fs.suid_dumpable=0',
    require => Exec['set-suid-dumpable'],
    refreshonly => true
  }

}
