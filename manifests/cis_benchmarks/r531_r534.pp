# Configure Password Creation Requirements
# Ensure lockout for failed password attempts is configured
# Ensure password reuse is limited
# Ensure password hashing algorithm is SHA-512

class cis::cis_benchmarks::r531_r534 {

  file { '/etc/pam.d/password-auth':
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/cis/pam/password-auth'
  }

  file { '/etc/pam.d/system-auth':
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/cis/pam/system-auth'
  }

  file { '/etc/security/pwquality.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/pam/pwquality.conf'
  }


}
