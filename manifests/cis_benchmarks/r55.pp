# Ensure access to the su command is restricted
class cis::cis_benchmarks::r55 {

if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    $su_config_path = "puppet:///modules/cis/pam/su"
  }
  elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {
    $su_config_path = "puppet:///modules/cis/pam/su_centos6" 
  } else {
    $su_config_path = "puppet:///modules/cis/pam/su"
  }

  file { '/etc/pam.d/su':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => "$su_config_path",
  } 

}
