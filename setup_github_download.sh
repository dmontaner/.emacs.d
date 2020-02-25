#!/bin/bash
# setup_github_download.sh
# 2017-05-30 david.montaner@gmail.com
# download all my github dependencies for emacs

mkdir downloaded_from_github/
cd    downloaded_from_github/

git clone https://github.com/emacs-ess/ESS
git clone https://github.com/antonj/Highlight-Indentation-for-Emacs
git clone https://github.com/auto-complete/auto-complete
git clone https://github.com/company-mode/company-mode
git clone https://github.com/magnars/dash.el
git clone https://github.com/jorgenschaefer/elpy
git clone https://github.com/ensime/emacs-sbt-mode
git clone https://github.com/ensime/emacs-scala-mode
git clone https://github.com/purcell/exec-path-from-shell
git clone https://github.com/technomancy/find-file-in-project
git clone https://github.com/jrblevin/markdown-mode
git clone https://github.com/polymode/polymode
git clone https://github.com/polymode/poly-markdown
git clone https://github.com/auto-complete/popup-el
git clone https://github.com/jorgenschaefer/pyvenv
git clone https://github.com/magnars/s.el
git clone https://github.com/joaotavora/yasnippet
git clone https://github.com/joshwnj/json-mode
git clone https://github.com/Sterlingg/json-snatcher
git clone https://github.com/gongo/json-reformat
git clone https://github.com/DamienCassou/hierarchy
git clone https://github.com/DamienCassou/json-navigator
git clone https://github.com/yoshiki/yaml-mode


## ess needs a make
## it has this dependencies before:
## sudo apt-get install texlive
cd ESS
make
cd ..

# ## elpy 17 is broken use 16.1 ; elpy 1.9.0 seems to be working fine
# cd elpy
# git checkout tags/1.16.1
# cd ..
