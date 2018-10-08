# audit logs: Ensure system is disabled when full and are not autmatically deleted
class cis::cis_benchmarks::r4112_r4113_r412 {

  file { '/etc/audit/auditd.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0640',
    source => 'puppet:///modules/cis/audit/auditd.conf',
  }

  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    exec { 'auditd_privileged_rules':
      command => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /etc/audit/rules.d/privileged.rules',
      path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
      onlyif => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /tmp/privileged.rules ; ! diff /tmp/privileged.rules /etc/audit/rules.d/privileged.rules &&  rm -f /tmp/privileged.rules',
      require => File['audit_rules'],
      notify => Service[auditd],
    }
  }
  elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {
    exec { 'auditd_privileged_rules':
      command => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /etc/audit/rules.d/privileged.rules',
      path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
      onlyif => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /tmp/privileged.rules ; ! diff /tmp/privileged.rules /etc/audit/rules.d/privileged.rules &&  rm -f /tmp/privileged.rules',
      require => File['audit_rules'],
    }
  } else {
    exec { 'auditd_privileged_rules':
      command => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /etc/audit/rules.d/privileged.rules',
      path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
      onlyif => 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }\' > /tmp/privileged.rules ; ! diff /tmp/privileged.rules /etc/audit/rules.d/privileged.rules &&  rm -f /tmp/privileged.rules',
      require => File['audit_rules'],
      notify => Service[auditd],
    }
  }

  service { 'auditd':
    ensure => running,
    enable => true,
    restart => "/sbin/service auditd restart",
  }

}
