#!/bin/bash
service ssh start
mkdir /root/.ssh
cp -Rf /home/git/YottaDB-Demo/.ssh/* /root/.ssh
mkdir /home/footie
cp -Rf /home/git/YottaDB-Demo/EnglishFootball/* /home/footie
cp /home/git/YottaDB-Demo/lsyncd/lsyncd.conf /etc/lsyncd.conf
mkdir /home/entrypoint
cp -Rf /home/git/YottaDB-Demo/Kubernetes/mgwebentry/* /home/entrypoint
cp -Rf /home/git/YottaDB-Demo/mapped/* /opt/mgweb/mapped
cd /usr/local/YottaDB-dashboard/glbview
/usr/local/YottaDB-dashboard/glbview/globview.sh start
/usr/local/bin/start.sh
if ! test -f /opt/yottadb/yottadb.gld
then
 /usr/local/bin/dbprov.sh
 (echo "D ^%GI";echo "/home/footie/Football.go";echo "") | ydb
 sleep 1
 cd /opt/mgweb && /opt/mgweb/start
else
 /home/entrypoint/start.sh
fi
