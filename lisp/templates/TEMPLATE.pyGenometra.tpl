#!/usr/bin/python3
##(>>>FILE<<<)
##(>>>ISO_DATE<<<) david.montaner@genomicsengland.co.uk
##(>>>COMMENT<<<)

#### MY PYTHON LOG FILE ########################################################
import os
import time
import logging
import re
import sys

from subprocess import Popen, PIPE
###
myscript = sys.argv[0]
if (myscript == '/usr/bin/ipython'): myscript = 'Z_PYTHON'
##
logging.basicConfig (filename = os.path.abspath (myscript) + '.log',
                     level = logging.DEBUG,
                     format = '%(asctime)s %(levelname)-8s %(message)s',
                     datefmt = '%Y-%m-%d %H:%M:%S', filemode = 'w')
##
logging.info ('STARTS ' + os.path.abspath (myscript) + '\n')
################################################################################
################################################################################


###MENSAJES CON 
logging.info ( mensaje )





### CLOSE LOGGIN ###############################################################
logging.info ('DONE')
################################################################################
