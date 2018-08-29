# Disable IMAP and POP3 server
class cis::cis_benchmarks::r2211 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-dovecot':
    command => 'chkconfig dovecot off',
    onlyif => 'chkconfig --list | grep dovecot | grep on'
  }


  package { 'install_ntp':
    name => "ntp",
    ensure => "latest",
    allow_virtual => false,
  }

  file { 'ntp_config':
    path => "/etc/ntp.conf",
    ensure => present,
    source => 'puppet:///modules/cis/ntp/ntp.conf',
    require => Package['install_ntp'],
  }




  service { 'httpd':
    ensure 		=> running,
    name 		=> ntpd,
    enable 		=> true,
    subscribe 	=> [File['ntp_config']]
  }
}
