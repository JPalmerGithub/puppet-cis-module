# audit logs: Ensure system is disabled when full and are not autmatically deleted
class cis::cis_benchmarks::r4112_r4113_r412 {

  file { '/etc/audit/auditd.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0640',
    source => 'puppet:///modules/cis/audit/auditd.conf',
    require => File_line['auditd_enable_rulesd'],
    notify => Service['auditd']
  }

  exec { 'auditd_privileged_rules':
    command => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged" }\' > /etc/audit/rules.d/privileged.rules',
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
    require => File_line['auditd_enable_rulesd'],
  }

  service { 'auditd':
    ensure => running,
    enable => true,
    restart => "/sbin/service auditd restart",
    subscribe => File['/etc/audit/auditd.conf'],
    require => File['/etc/audit/auditd.conf'],
  }

}
