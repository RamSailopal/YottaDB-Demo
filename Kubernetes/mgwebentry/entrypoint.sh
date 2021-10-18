#!/bin/bash
service ssh start
cd /usr/local/YottaDB-dashboard/glbview
/usr/local/YottaDB-dashboard/glbview/globview.sh start
/usr/local/bin/start.sh
if ! test -f /opt/yottadb/yottadb.gld
then
 /usr/local/bin/dbprov.sh
 (echo "D ^%GI";echo "/home/footie/Football.go";echo "") | ydb
fi
cd /opt/mgweb && /opt/mgweb/start
