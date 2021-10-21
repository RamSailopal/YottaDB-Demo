#!/bin/bash
mkdir /home/metabase
cp -f /home/git/YottaDB-Demo/metabase/* /home/metabase
echo "$IPADD demo_yottamgweb_1" >> /etc/hosts
/app/bin/start
