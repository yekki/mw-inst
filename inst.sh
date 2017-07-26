#!/bin/bash

source common.sh
if [[ -x "products/$1.sh" ]]
then
	source "products/$1.sh"
	$JAVA_HOME/bin/java -jar -D64 $ORACLE_IMAGE -silent -responseFile /tmp/inst_resp -invPtrLoc /tmp/inventory_loc
else
	echo "Unsupported Oracle product:$1"
	exit -1
fi