RPMs and installation script to generate a local yum repo for GDAL dependencies on CentOS 7
Getting all dependencies for the GDAL package. The rpms directory inside the tarball was populated by running the 

following commands:

```
repotrack -a x86_64 -p rpms/ gdal
rm -f rpms/*i686*
yum install --downloadonly --downloaddir=. openssl-devel curl-devel postgresql-devel
tar -czvf gdal_depends.tar.gz rpms/
```

Execute the included setup_repo.sh script inside the desired location for the local repo RPMs to reside.
