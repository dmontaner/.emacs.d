#!/bin/bash
# download_github.sh
# 2017-05-30 david.montaner@barclays.com
# download all my github dependencies for emacs

mkdir download_from_github/
cd    download_from_github/

git clone https://github.com/emacs-ess/ESS
git clone https://github.com/antonj/Highlight-Indentation-for-Emacs
git clone https://github.com/auto-complete/auto-complete
git clone https://github.com/company-mode/company-mode
git clone https://github.com/magnars/dash.el
git clone https://github.com/jorgenschaefer/elpy
git clone https://github.com/ensime/emacs-sbt-mode
git clone https://github.com/ensime/emacs-scala-mode
git clone https://github.com/ensime/ensime-emacs
git clone https://github.com/purcell/exec-path-from-shell
git clone https://github.com/jrblevin/markdown-mode
git clone https://github.com/vspinu/polymode
git clone https://github.com/auto-complete/popup-el
git clone https://github.com/jorgenschaefer/pyvenv
git clone https://github.com/magnars/s.el
git clone https://github.com/joaotavora/yasnippet

## ess needs a make
## it has this dependencies before:
## sudo apt-get install texlive
cd ESS
make
