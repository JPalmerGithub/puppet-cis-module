# Ensure no unowned files or directories exist
class cis::cis_benchmarks::r6111 {

  exec { 'check-unowned-files':
    path => [ '/bin', '/usr/bin' ],
    command => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -nouser > /var/log/cis/unowned_files_dir.log",
    user => 'root',
    onlyif => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -nouser | grep /",
    notify => Exec['check-unowned-files-result'],
  }

  exec { 'check-unowned-files-result':
    path => '/bin',
    command => 'echo Check /var/log/cis/unowned_files_dir.log for unowned files and directories.',
    logoutput => true,
    refreshonly => true,
  }

}
