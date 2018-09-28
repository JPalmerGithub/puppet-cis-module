### CIS Hardening Module for Puppet


#### Assumptions
 - Secondary EBS disk is in /dev/xvdb
 - Partioning scheme is https://github.com/johnalvero/part-on-boot/blob/master/scheme.txt

If this is not the case, modify https://github.com/VoyagerInnovations/puppet-cis-module/blob/master/manifests/cis_benchmarks/r112.pp
 

#### Installing
1. Download puppet and git
```
# Centos 7
yum install -y epel-release
yum install -y git puppet --enablerepo=epel

# Centos 6
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y git puppet --enablerepo=puppetlabs-products

# Centos 6/7
puppet module install puppetlabs-stdlib --version 5.0.0
```
2. Download and install the module
```
git clone https://github.com/VoyagerInnovations/puppet-cis-module.git /etc/puppet/modules/cis
```
3. Apply
```
puppet apply -e "Package { allow_virtual => false} include cis::main" 
```


