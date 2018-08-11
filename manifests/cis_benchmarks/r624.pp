# Ensure no legacy "+" entries exist in /etc/group
class cis::cis_benchmarks::r624 {

  exec { 'remove-group-legacy-entries':
    path => '/bin',
    command => "sed -i '/^+:/d' /etc/group",
    user => 'root',
    onlyif => "grep '^+:' /etc/group"
  }

}
