#!/bin/bash
#/* **************** LFS311:7.1 s_02/track-STRESS.sh **************** */
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
#
# This little script is used with the LFS311 lab exercise 
# on systemd startup files and their affect on a background
# service. The "foo" service. 
#
# The script looks for "stress" launched with a PPID of 1 
# and it's chidren processes then uses the "ps" command
# to collect some information. 

while [ true ]
do

# reset the variables to make sure we are picking up 
# current information
PID=""
PID1=""
clear 

echo "$0 is running" 

# sift and sort the pid's 
PID1=` ps -ef  | grep stress | grep -v grep | awk '{print $1,$2,$3,$6}'`
PID=`echo $PID1 |  grep "1 "| awk '{print $2}' `
echo "The pid for stress is $PID" 

# using our list of pid's, grab some information 
ps  --ppid $PID  --pid $PID -o pid,ppid,comm,vsz,pcpu,psr,slice 2>/dev/null

sleep 5 
done 
exit

