# Configure permissions /etc/ssh/sshd_config
# Ensure SSH Protocol is set to 2
# Ensure SSH LogLevel is set to INFO
# Ensure SSH X11 forwarding is disabled
# Ensure SSH MaxAuthTries is set to 4 or less
# Ensure SSH IgnoreRhosts is enabled
# Ensure SSH HostbasedAuthentication is disabled
# Ensure SSH root login is disabled
# Ensure SSH PermitEmptyPasswords is disabled
# Ensure SSH PermitUserEnvironment is disabled
# Ensure only approved ciphers are used
# Ensure only approved MAC algorithms are used
# Ensure SSH Idle Timeout Interval is configured
# Ensure SSH LoginGraceTime is set to one minute or less
# Ensure SSH warning banner is configured

class cis::cis_benchmarks::r521_r5216 {

  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    $sshd_config_path = "puppet:///modules/cis/sshd_config"
  }
  elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {
    $sshd_config_path = "puppet:///modules/cis/sshd_config_centos6"
  } else {
    $sshd_config_path = "puppet:///modules/cis/sshd_config_centos6"
  }


  file { '/etc/ssh/sshd_config':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600',
    source => "$sshd_config_path",
  }

  service { 'sshd':
    ensure => running,
    enable => true,
    subscribe => File['/etc/ssh/sshd_config']
  }

}
