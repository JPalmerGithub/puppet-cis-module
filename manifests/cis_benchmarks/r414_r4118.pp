# Ensure events that modify date and time information are collected
# Ensure events that modify user/group information are collected
# Ensure events that modify the system's network environment are collected
# Ensure events that modify the system's Mandatory Access Controls are collected
# Ensure login and logout events are collected
# Ensure session initiation information is collected
# Ensure discretionary access control permission modification events are collected
# Ensure unsuccessful unauthorized file access attempts are collected
# Ensure use of privileged commands is collected
# Ensure successful file system mounts are collected
# Ensure file deletion events by users are collected
# Ensure changes to system administration scope (sudoers) is collected
# Ensure system administrator actions (sudolog) are collected
# Ensure kernel module loading and unloading is collected
# Ensure the audit configuration is immutable

class cis::cis_benchmarks::r414_r4118 {

  case $::hardwaremodel {
    'x86_64': {
      $content_source = 'puppet:///modules/cis/audit/audit.rules.64'
    }

    default: {
      $content_source = 'puppet:///modules/cis/audit/audit.rules.32'
    }
  }

  file { '/etc/audit/audit.rules':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0640',
    source => $content_source,
    notify => Service['auditd']
  }

}
