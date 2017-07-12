#!/bin/bash

source common.sh

java -jar -D64 $IMAGE_HOME/fmw_12.2.1.2.0_coherence.jar -silent -responseFile $APP_HOME/$ORACLE_PRODUCT/resp -invPtrLoc $APP_HOME/$ORACLE_PRODUCT/loc