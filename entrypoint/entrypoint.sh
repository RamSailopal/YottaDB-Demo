#!/bin/bash
service ssh start
cd /usr/local/YottaDB-dashboard/glbview
/usr/local/YottaDB-dashboard/glbview/globview.sh start
/usr/local/bin/dbprov.sh
/usr/local/bin/start.sh
(echo "D ^%GI";echo "/home/footie/Football.go";echo "") | ydb
cd /opt/mgweb && /opt/mgweb/start
