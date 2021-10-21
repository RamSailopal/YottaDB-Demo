#!/bin/bash
mkdir /home/metabase
cp -f /home/git/YottaDB-Dashboard/Metabase/* /home/metabase
echo "$IPADD demo_yottamgweb_1" >> /etc/hosts
/app/bin/start
