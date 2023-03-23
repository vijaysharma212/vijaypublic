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
###          nohup sh xtt-rman-restore-from-level1-backup.sh &
##  Example- nohup sh xtt-rman-restore-from-level1-backup.sh &
#  where,
#    nohup = Use nohup to run a script/process(job) on a server and have it continue after you have logged out or otherwise lost connection to the server
#    & = To execute script/job in background.
######################################################################################################

BKP_PATH='/orastage/tts_backup/level1'
CURRTIME=`date +"%y%m%d-%H%M%S"`
logfile="${BKP_PATH}/RMAN_recover_level_1_${CURRTIME}".log
##logfile1="${BKP_PATH}RMAN_reportschema${CURRTIME}".log

sid=$1

ORACLE_SID=$sid;export ORACLE_SID
ORAENV_ASK=NO;export ORAENV_ASK
unset ORAENV_ASK

$ORACLE_HOME/bin/rman target / msglog ${logfile} <<EOF1
run {
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
w--recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/PAINDEX.288.1088236637' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_vb0d7p13_1_1.bkp'  from platform 'AIX-Based Systems (64-bit)';
w--recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/PAINDEX.287.1088236671' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_v90d7p12_1_1.bkp'  from platform 'AIX-Based Systems (64-bit)';
W--recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/PAINDEX.280.1088236653' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_vb0d7p13_1_1.bkp'  from platform 'AIX-Based Systems (64-bit)';
w--recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERAETNA.283.1088236731' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_v80d7p12_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
W-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERAETNA.284.1088236933' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_va0d7p12_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERAETNA.289.1088237031' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_va0d7p12_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERAETNA.311.1088236837' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_1_v90d7p12_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERDATA.277.1088238005' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0s0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERDATA.291.1088238001' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0t0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERDATA.312.1088237997' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0u0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USEREPA.269.1088238111' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0u0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USEREPA.278.1088238037' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0s0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USEREPA.279.1088238093' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_3_0t0d7pvf_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy '+CASDATA01/CASREG/DATAFILE/USERS.272.1088238127' from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_120d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.259.1088237663'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_100d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.270.1088237547'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_110d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.271.1088237183'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_0v0d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.285.1088237547'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_110d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.290.1088237381'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_100d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.292.1088237381'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_0v0d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERFEP.293.1088237183'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_4_120d7q2f_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/OEM_CONTROL.281.1088236635'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_5_140d7qa5_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/PERFSTAT.282.1088236633'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_5_130d7qa5_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
w-recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USER_DATA.310.1088238135'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_5_150d7qa5_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy    '+CASDATA01/CASREG/DATAFILE/TOOLS.286.1088236687'       from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vg0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.268.1088248197'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vd0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.273.1088251579'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_ve0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.274.1088251579'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_ve0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.275.1088252111'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vf0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.276.1088251579'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vg0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.294.1088249343'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vf0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.295.1088249343'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vc0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.296.1088249343'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_ve0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.297.1088250719'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vd0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.298.1088250719'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vg0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.299.1088250719'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vg0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.300.1088252111'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vc0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.301.1088248197'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vc0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.302.1088248197'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vd0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.306.1088252621'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vd0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.307.1088252621'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vf0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.308.1088252621'	from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_ve0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
recover foreign datafilecopy 	'+CASDATA01/CASREG/DATAFILE/USERASAP.309.1088252111'	 from backupset '/orastage/work/RMAN_TTS/level_1/tablespaces_incr1_2_vc0d7p9d_1_1.bkp' from platform 'AIX-Based Systems (64-bit)';
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



tablespaces_incr1_1_v80d7p12_1_1.bkp
tablespaces_incr1_1_v90d7p12_1_1.bkp
tablespaces_incr1_1_va0d7p12_1_1.bkp
tablespaces_incr1_1_vb0d7p13_1_1.bkp==

tablespaces_incr1_2_vc0d7p9d_1_1.bkp
tablespaces_incr1_2_vd0d7p9d_1_1.bkp
tablespaces_incr1_2_ve0d7p9d_1_1.bkp
tablespaces_incr1_2_vf0d7p9d_1_1.bkp
tablespaces_incr1_2_vg0d7p9d_1_1.bkp
tablespaces_incr1_3_0s0d7pvf_1_1.bkp
tablespaces_incr1_3_0t0d7pvf_1_1.bkp
tablespaces_incr1_3_0u0d7pvf_1_1.bkp
tablespaces_incr1_4_0v0d7q2f_1_1.bkp
tablespaces_incr1_4_100d7q2f_1_1.bkp
tablespaces_incr1_4_110d7q2f_1_1.bkp
tablespaces_incr1_4_120d7q2f_1_1.bkp
tablespaces_incr1_5_130d7qa5_1_1.bkp
tablespaces_incr1_5_140d7qa5_1_1.bkp
tablespaces_incr1_5_150d7qa5_1_1.bkp