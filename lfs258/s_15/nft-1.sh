#!/bin/bash
#/* **************** LFS311:7.1 s_15/nft-1.sh **************** */
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
nft flush ruleset
 nft add table inet filter_it
 nft add chain inet filter_it  input_stuff {type filter hook input priority 0 \; }
 nft add rule inet filter_it input_stuff tcp dport 22 accept
 nft list tables
 nft list table inet filter_it
 nft add rule inet filter_it input_stuff ct state established,related accept
 nft add rule inet filter_it input_stuff counter
 nft list table inet filter_it

nft add rule inet filter_it input_stuff drop
nft list table inet filter_it
