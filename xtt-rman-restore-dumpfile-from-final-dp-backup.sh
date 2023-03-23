#!/bin/bash

###########################################################################################################
# Script Name: xtt-rman-restore-from-level1-backup.sh
# Version = 1.0
#
# Description:
#   Standard script for restore tablespaces datafiles from backup for transport tablespace migration
#   Variable BKP_PATH need to change as per actual backup location.
#
#   Usage of script :
#   Before run the script change the Backup location for "BKP_PATH" variable
#   Before run the script change the backupset location and source OS platform name
###          nohup sh xtt-rman-restore-final.sh &
##  Example- nohup sh xtt-rman-restore-final.sh &
#  where,
#    nohup = Use nohup to run a script/process(job) on a server and have it continue after you have logged out or otherwise lost connection to the server
#    & = To execute script/job in background.
######################################################################################################

BKP_PATH='/u01/on-prem-bkp/TESTDB/'
DATAPUMP_PATH='/u01/on-prem-bkp/TESTDB/datapump'
CURRTIME=`date +"%y%m%d-%H%M%S"`
logfile="${BKP_PATH}RMAN_restore_datapump_file_final_${CURRTIME}".log
##logfile1="${BKP_PATH}RMAN_reportschema${CURRTIME}".log

sid=$1

ORACLE_SID=$sid;export ORACLE_SID
ORAENV_ASK=NO;export ORAENV_ASK
unset ORAENV_ASK

$ORACLE_HOME/bin/rman target / msglog ${logfile} <<EOF1
run {
ALLOCATE CHANNEL c1 DEVICE TYPE disk;
ALLOCATE CHANNEL c2 DEVICE TYPE disk;
ALLOCATE CHANNEL c3 DEVICE TYPE disk;
ALLOCATE CHANNEL c4 DEVICE TYPE disk;
ALLOCATE CHANNEL c5 DEVICE TYPE disk;
ALLOCATE CHANNEL c6 DEVICE TYPE disk;
restore dump file datapump destination '$DATAPUMP_PATH' from backupset '$BKP_PATH/tablespaces_datapump.dmp';
release channel c1;
release channel c2;
release channel c3;
release channel c4;
release channel c5;
release channel c6;
}
exit;
EOF1
exit;