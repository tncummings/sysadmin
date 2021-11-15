#!/bin/bash
#/* **************** LFS311:7.1 s_20/myfirstrpm-suse.sh **************** */
#/*
# * The code herein is: Copyright the Linux Foundation, 2021
# *
# * This Copyright is retained for the purpose of protecting free
# * redistribution of source.
# *
# *     URL:    https://training.linuxfoundation.org
# *     email:  info@linuxfoundation.org
# *
# * This code is distributed under Version 2 of the GNU General Public
# * License, which you should have received with the source.
# *
# */
#!/bin/bash

BASEDIR="/usr/src/packages"

# make sure the directories are available 
#mkdir -p ~/rpmbuild/{SOURCES,SPECS}
mkdir -p /usr/src/packages/{SOURCES,SPECS}

#copy the filest to the correct locations 
cp myapprpm-1.0.0.tar.gz $BASEDIR/SOURCES
cp myapprpm.spec $BASEDIR/SPECS

# build it 

rpmbuild -ba $BASEDIR/SPECS/myapprpm.spec 

echo ""
echo ""
echo "You should have a new rpm file to install"
echo " and a new src rpm,  check the following locations:" 
echo "$BASEDIR/SRPMS/myapprpm-1.0.0-1.src.rpm"
echo "$BASEDIR/RPMS/x86_64/myapprpm-1.0.0-1.x86_64.rpm"
echo ""
echo "You should be able to install the new program with:"  
echo ""
echo "sudo rpm -ivh $BASEDIR/RPMS/x86_64/myapprpm-1.0.0-1.x86_64.rpm " 
