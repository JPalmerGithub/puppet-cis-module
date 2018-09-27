# audit logs: Ensure system is disabled when full and are not autmatically deleted
class cis::cis_benchmarks::r4112_r4113_r412 {

  file { '/etc/audit/auditd.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0640',
    source => 'puppet:///modules/cis/audit/auditd.conf',
    notify => Service['auditd']
  }

  service { 'auditd':
    ensure => running,
    enable => true,
    restart => "systemctl restart auditd",
    subscribe => File['/etc/audit/auditd.conf']
  }

}
