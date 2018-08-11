# Ensure root is the only UID 0 account
class cis::cis_benchmarks::r625 {

  user { 'root':
    uid => 0,
    gid => 0
  }

}
