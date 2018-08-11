# Ensure no legacy "+" entries exist in /etc/shadow
class cis::cis_benchmarks::r623 {

  exec { 'remove-shadow-legacy-entries':
    path => '/bin',
    command => "sed -i '/^+:/d' /etc/shadow",
    user => 'root',
    onlyif => "grep '^+:' /etc/shadow"
  }

}
