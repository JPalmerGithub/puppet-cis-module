### CIS Hardening Module for Puppet

#### Using Git
1. Download puppet and git
```
yum install -y epel-release
yum install -y puppet git --enablerepo=epel
```
2. Download and install the module
```
git clone https://github.com/VoyagerInnovations/puppet-cis-module.git /etc/puppet/modules/cis
```

#### Using curl
Because the git package install a lot of dependencies
1. Install puppet
```
yum install -y epel-release
yum install -y unzip puppet --enablerepo=epel
```
2. Download and install the module
```
curl -o /tmp/cis.zip https://codeload.github.com/VoyagerInnovations/puppet-cis-module/zip/master
unzip /tmp/cis.zip -d /tmp/
mkdir /etc/puppet/modules/cis && mv /tmp/xxx/puppet-cis-module-master/* $_
```
3. Apply
```
puppet apply -e "Package { allow_virtual => false} include cis::main" 
```
