#!/bin/bash
# (>>>FILE<<<)
# (>>>ISO_DATE<<<) david.montaner@barclays.com
# (>>>COMMENT<<<)

# USE  2>&1 | tee -a $logfile TO REDIRECT THE OUTPUT OF THE COMMANDS;  -a IS FOR APPEND
# USE printf "mensaje\n\n" for messages

################################################################################
### START log file
################################################################################
myfile=`basename $0`
logfile=`pwd`/$myfile.log  #log file path and name
##
printf "RUNNING: $myfile\n" 2>&1 | tee    $logfile ##no append at the begining
date                        2>&1 | tee -a $logfile
echo ""                     2>&1 | tee -a $logfile
################################################################################
################################################################################

INSERT THE CODE HERE  2>&1 | tee -a $logfile

################################################################################
### END log file
################################################################################
printf "\nDONE\n" | tee -a $logfile
date              | tee -a $logfile
# ################################################################################
# ################################################################################
