# Uninstall LDAP Client
class cis::cis_benchmarks::r235 {

  package { 'openldap-clients':
    ensure => absent
  }

}
