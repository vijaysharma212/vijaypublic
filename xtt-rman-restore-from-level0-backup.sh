#!/bin/bash

###########################################################################################################
# Script Name: xtt-rman-restore-from-level0-backup.sh
# Version = 1.0
#
# Description:
#   Standard script for restore tablespaces datafiles from backup for transport tablespace migration
#   Variable BKP_PATH need to change as per actual backup location.
#
#   Usage of script :
#   Before run the script change the Backup location for "BKP_PATH" variable
#   Before run the script change the Tablespace name and backup files name
#          . oraenv
#            db_name
#           nohup sh xtt-rman-restore-from-level0-backup.sh &
#  Example- nohup sh xtt-rman-restore-from-level0-backup.sh &
#  where,
#    nohup = Use nohup to run a script/process(job) on a server and have it continue after you have logged out or otherwise lost connection to the server
#    & = To execute script/job in background.
######################################################################################################

BKP_PATH='/u01/on-prem-bkp/TESTDB/'
CURRTIME=`date +"%y%m%d-%H%M%S"`
logfile_res="${BKP_PATH}RMAN_restore_level_0_${CURRTIME}".log
##logfile1="${BKP_PATH}RMAN_reportschema${CURRTIME}".log
##bkpfile=PAINDEX_%U.bkp

sid=$1

ORACLE_SID=$sid;export ORACLE_SID
ORAENV_ASK=NO;export ORAENV_ASK
unset ORAENV_ASK

$ORACLE_HOME/bin/rman target / msglog ${logfile_res} <<EOF1
run {
ALLOCATE CHANNEL c1 DEVICE TYPE disk;
ALLOCATE CHANNEL c2 DEVICE TYPE disk;
ALLOCATE CHANNEL c3 DEVICE TYPE disk;
ALLOCATE CHANNEL c4 DEVICE TYPE disk;
ALLOCATE CHANNEL c5 DEVICE TYPE disk;
ALLOCATE CHANNEL c6 DEVICE TYPE disk;
ALLOCATE CHANNEL c7 DEVICE TYPE disk;
ALLOCATE CHANNEL c8 DEVICE TYPE disk;
ALLOCATE CHANNEL c9 DEVICE TYPE disk;
ALLOCATE CHANNEL c10 DEVICE TYPE disk;
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/OEM_CONTROL_v50d66bt_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/OEM_CONTROL_v60d66bu_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/PAINDEX_ub0d63gm_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/PAINDEX_uc0d63gm_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/PAINDEX_ud0d63gm_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/TOOLS_ue0d63h6_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERAETNA_uf0d63h7_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERAETNA_ug0d63h7_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERAETNA_uh0d63h8_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERAETNA_ui0d63h8_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uj0d63pi_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uj0d63pi_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uk0d63pi_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uk0d63pi_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_ul0d63pi_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_ul0d63pi_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_um0d63pi_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_um0d63pi_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_un0d63pj_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_un0d63pj_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uo0d63pj_1_1.bkp','/orastage/work/RMAN_TTS/level_0/level_0/USERASAP_uo0d63pj_2_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERFEP_us0d65pc_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERFEP_ut0d65pc_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERFEP_uu0d65pc_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERFEP_uv0d65pc_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERDATA_up0d65pa_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERDATA_uq0d65pa_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERDATA_ur0d65pa_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USEREPA_v10d6670_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USEREPA_v20d6670_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USEREPA_v30d6670_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USERS_v40d66br_1_1.bkp';
restore from platform 'AIX-Based Systems (64-bit)' all foreign datafiles to new from backupset '/orastage/work/RMAN_TTS/level_0/level_0/USER_DATA_v70d66bv_1_1.bkp';
release channel c1;
release channel c2;
release channel c3;
release channel c4;
release channel c5;
release channel c6;
release channel c7;
release channel c8;
release channel c9;
release channel c10;
}
exit;
EOF1
exit;