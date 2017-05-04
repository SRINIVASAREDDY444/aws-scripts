#!/bin/bash
/usr/bin/cli53 list|awk '{print $2}'| tail -n +2 |
 while read line;
 do 
/usr/bin/cli53 export ${line} > /root/backup/${line}$(date +"%Y_%m_%d"); 
aws s3 cp /root/backup/${line}$(date +"%Y_%m_%d") s3://dns-records-backup;      if [ $? -eq 0 ]
then
mail -s "Successfully created DNS records" sample@gmail.com
else
mail -s "Process fail to create DNS records" sample@gmail.com
fi
rm /root/backup/${line}$(date +"%Y_%m_%d");
done

