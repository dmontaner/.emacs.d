## (>>>FILE<<<)
## (>>>ISO_DATE<<<) david.montaner@gmail.com
## (>>>COMMENT<<<)

date()
Sys.info()[c("nodename", "user")]
commandArgs()
rm(list = ls())
R.version.string  # "R version 3.6.1 (2019-07-05)"
library(yaml)
## library(dplyr); packageDescription("dplyr", fields = "Version")  # "0.8.0.1"
## library(tibble); packageDescription("tibble", fields = "Version")  # "2.1.1"
## library(ggplot2); packageDescription("ggplot2", fields = "Version")  # "3.1.0"
## library(feather); packageDescription("feather", fields = "Version")  # "0.3.3"
## library(readr); packageDescription("readr", fields = "Version")  # "1.3.1"

# CONFIG
if (!exists(".job")) {.job <- read_yaml('../config/config.yml')}

options(width = 172)
options(width = 300)

## ### FUNCTIONS
## if(!"F" %in% search()) attach(NULL, name = "F")
## sapply(dir(.job$dir$functions, full.names = TRUE, pattern = ".[r|R]$"), source, local = as.environment("F"))
## search()
## ls("F") # list of functions here
## ls()

################################################################################


### DATA
setwd(file.path(.job$dir_data))
setwd(file.path(.job$dir_proces))
setwd(file.path(.job$dir_rawdat))
dir()


### STARTS knitr SPIN output(Some markup is needed straight after)
try(opts_chunk$set(results = "markup")) ## "markup" "hide" "asis"

### CLOSES knitr SPIN output(Some markup is needed straight after)
try(opts_chunk$set(results = "hide")) ## "markup" "hide" "asis"
##' -----------------------
##' Completed:  `r date()`


###EXIT
warnings()
sessionInfo()
q("no")
