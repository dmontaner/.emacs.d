#!/bin/bash
# (>>>FILE<<<)
# (>>>ISO_DATE<<<) david.montaner@gmail.com
# (>>>COMMENT<<<)

# config
# REPO_PATH="$(dirname "$(realpath "$0")")"               # from base
# REPO_PATH="$(dirname "$(dirname "$(realpath "$0")")")"  # from scripts

dir_rawdat=`yq -r '.dir_rawdat' "$REPO_PATH/config/config.yml"`
dir_proces=`yq -r '.dir_proces' "$REPO_PATH/config/config.yml"`
