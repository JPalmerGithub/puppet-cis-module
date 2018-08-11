# Ensure access to the su command is restricted
class cis::cis_benchmarks::r55 {

  file { '/etc/pam.d/su':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/user_accounts/su'
  } 

}
