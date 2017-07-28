#!/bin/bash
cat > /tmp/uninst_resp <<- UNINST_RESP
[ENGINE]

#DO NOT CHANGE THIS.
Response File Version=1.0.0.0.0

[GENERIC]

#This will be blank when there is nothing to be de-installed in distribution level
SELECTED_DISTRIBUTION=Coherence~12.2.1.2.0

#The oracle home location. This can be an existing Oracle Home or a new Oracle Home
ORACLE_HOME=$ORACLE_HOME

UNINST_RESP


cat > /tmp/inst_resp <<- INST_RESP
[ENGINE]
Response File Version=1.0.0.0.0
[GENERIC]

ORACLE_HOME=$ORACLE_HOME
INSTALL_TYPE=Typical With Examples

MYORACLESUPPORT_USERNAME=
MYORACLESUPPORT_PASSWORD=<SECURE VALUE>
DECLINE_SECURITY_UPDATES=true
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false

INST_RESP
