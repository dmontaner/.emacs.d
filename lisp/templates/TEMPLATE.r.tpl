##(>>>FILE<<<)
##(>>>ISO_DATE<<<) david.montaner@barclays.com
##(>>>COMMENT<<<)

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ## "R version 3.4.0 (2017-04-21)"
#library (); packageDescription ("", fields = "Version") # 

try (source (".job.r")); try (.job)

options (width = 130)
options (width = 240)

### FUNCTIONS
if (!"F" %in% search ()) attach (NULL, name = "F")
sapply (dir (.job$dir$functions, full.names = TRUE, pattern = ".[r|R]$"), source, local = as.environment ("F"))
search ()
ls ("F") # list of functions here
ls ()

################################################################################


### DATA
setwd (file.path (.job$dir$data))
setwd (file.path (.job$dir$proces))
setwd (file.path (.job$dir$rawdat))
dir ()


### STARTS knitr SPIN output (Some markup is needed straight after)
try (opts_chunk$set (results = "markup")) ## "markup" "hide" "asis"

### CLOSES knitr SPIN output (Some markup is needed straight after)
try (opts_chunk$set (results = "hide")) ## "markup" "hide" "asis"
##' -----------------------
##' Completed:  `r date ()`


###EXIT
warnings ()
sessionInfo ()
q ("no")
