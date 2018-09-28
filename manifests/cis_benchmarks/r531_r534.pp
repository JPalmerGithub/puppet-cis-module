# Configure Password Creation Requirements
# Ensure lockout for failed password attempts is configured
# Ensure password reuse is limited
# Ensure password hashing algorithm is SHA-512

class cis::cis_benchmarks::r531_r534 {

  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    $passwordauth_path = "puppet:///modules/cis/pam/password-auth"
    $systemauth_path = "puppet:///modules/cis/pam/system-auth"

    file { '/etc/security/pwquality.conf':
      ensure => file,
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/cis/pam/pwquality.conf',
    }


  }
  elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {
    $passwordauth_path = "puppet:///modules/cis/pam/password-auth_centos6"
    $systemauth_path = "puppet:///modules/cis/pam/system-auth_centos6"
  } else {
    $passwordauth_path = "puppet:///modules/cis/pam/password-auth"
    $systemauth_path = "puppet:///modules/cis/pam/system-auth"
  }


  file { '/etc/pam.d/password-auth':
    owner => 'root',
    group => 'root',
    source => "$passwordauth_path",
  }

  file { '/etc/pam.d/system-auth':
    owner => 'root',
    group => 'root',
    source => "$systemauth_path",
  }

  #file { '/etc/security/pwquality.conf':
  #  ensure => file,
  #  owner => 'root',
  #  group => 'root',
  #  mode => '0644',
  #  source => 'puppet:///modules/cis/pam/pwquality.conf'
  #}


}
