#!/bin/bash
# setup_github_update.sh
# 2017-11-14 david.montaner@gmail.com
# update all dependencies form github

cd downloaded_from_github/

for f in *
do
    echo $f
    cd $f
    # git branch  ## ALL ARE MASTER BRANCHES
    git pull origin master
    cd ..
done

echo "ess will need a make !!!!"
## ess needs a make
## it has this dependencies before:
## sudo apt-get install texlive
cd ESS
make
cd ..
