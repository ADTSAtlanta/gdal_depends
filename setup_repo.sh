#!/bin/bash
echo "Running Setup"
curDir=`pwd`
echo "Extracting RPMs"
tar -xzvf gdal_depends.tar.gz
echo "Populating gdaldepends.repo file"
cat >/etc/yum.repos.d/gdaldepends.repo <<EOL
[gdaldepends]
name=GDAL Dependencies
baseurl=file://$curDir
gpgcheck=0
enabled=1
EOL
echo "Installing createrepo"
yum --nogpgcheck localinstall -y createrepo
echo "Initializing the gdaldepends local yum repository"
createrepo $curDir
echo "Installing gdal and any necessary dependencies"
yum install --disablerepo="*" --enablerepo="gdaldepends" gdal
