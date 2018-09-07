## (>>>FILE<<<)
## (>>>ISO_DATE<<<) david@insightcapital.io
## (>>>COMMENT<<<)

date()
Sys.info()[c("nodename", "user")]
commandArgs()
rm(list = ls())
R.version.string ## "R version 3.4.0 (2017-04-21)"
## library(dplyr); packageDescription("dplyr", fields = "Version") # "0.7.6"
## library(tibble); packageDescription("tibble", fields = "Version") # "1.4.2"
## library(ggplot2); packageDescription("ggplot2", fields = "Version") # "3.0.0"
## library(readr); packageDescription("readr", fields = "Version") # "1.1.1"
## library(feather); packageDescription("feather", fields = "Version") # "0.3.1"

try(if(!exists(".job")) {.job <- new.env(); source("../.job.conf", local = .job); .job <- as.list(.job)}); try(.job)

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
