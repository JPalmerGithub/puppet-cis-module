# Ensure no legacy "+" entries exist in /etc/passwd
class cis::cis_benchmarks::r622 {

  exec { 'remove-passwd-legacy-entries':
    path => '/bin',
    command => "sed -i '/^+:/d' /etc/passwd",
    user => 'root',
    onlyif => "grep '^+:' /etc/passwd"
  }

}
