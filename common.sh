#!/bin/bash

ORACLE_HOME=/Users/gniu/Oracle/coh12c
#ORACLE_IMAGE=/Users/gniu/fmw_12.2.1.2.0_wls.jar
ORACLE_IMAGE=/Users/gniu/fmw_12.2.1.2.0_coherence.jar
ORACLE_INVENTORY_LOC=/Users/gniu/Oracle/.oraInventory
ORACLE_INST_USER=staff
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home
APP_HOME=/Users/gniu/Dropbox/Workbench/mw-inst

cat > /tmp/inventory_loc <<- INVENTORY_LOC
inventory_loc=/Users/gniu/Oracle/.oraInventory
inst_group=staff
INVENTORY_LOC
