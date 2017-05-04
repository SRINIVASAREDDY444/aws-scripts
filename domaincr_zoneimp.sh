#!/bin/bash
#This script creats domain name then imports zone files
#Here we should mentionzone files directry path 
#################################################################
ls /root/dir/ | while read line;  
do  
/usr/bin/cli53 create ${line} && cli53 import ${line} --file ${line} --replace ; 
done

