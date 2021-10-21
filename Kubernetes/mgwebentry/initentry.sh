#!/bin/bash
export ydb_gbldir=/opt/yottadb/yottadb.gld
/usr/local/lib/yottadb/r130/mumps -run ^GDE < /opt/mgweb/gde.txt
/usr/local/lib/yottadb/r130/mupip create
/usr/local/lib/yottadb/r130/mupip rundown -region default
/usr/local/lib/yottadb/r130/mupip set -key_size=1019 -region default
/usr/local/lib/yottadb/r130/mupip set -record_size=1048576 -region default
(echo "D ^%GI";echo "/home/git/YottaDB-Demo/EnglishFootball/Football.go";echo "") | ydb
