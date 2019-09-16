;;; reload this config:
;;; M-x load-file ...  and press RETURN TWICE


;;; SET DEFAULT DICTIONARY
(setq ispell-dictionary "american")
;(setq ispell-dictionary "castellano8")


;;; BASIC CUSTOMIZATION
(setq inhibit-startup-message t)    ;; hide the startup message
(menu-bar-mode -1)                  ;; disable menu bar
(tool-bar-mode -1)                  ;; disable toolbar completely
(cua-mode t)                        ;; copy paste with C-c C-v
(defalias 'yes-or-no-p 'y-or-n-p)   ;; short yes no
(setq-default indent-tabs-mode nil) ;; use spaces instead of tabs when indenting
(column-number-mode t)
(load-theme 'wombat t)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)   ;; disable sound notifications
(set-cursor-color "#bb1515")        ;; set cursor color. Needs to be here after loading the template. Nice red: "#bb1515". White: "#ffffff"

;; FONT
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 110 :width normal)))))

;; font zoom
;; https://www.emacswiki.org/emacs/SetFonts#toc8
; (set-face-attribute 'default (selected-frame) :height 80) ; home screen

(setq-default parens-require-spaces nil) ;; do not insert space before the parentheses when using the function "insert-parentheses"

; (setq require-final-newline nil)       ;; do not insert new lines at the end of the file when saving
; (setq mode-require-final-newline nil)  ;; do not insert new lines at the end of the file when saving

;;; DO NOT SAVE HORRIBLE (~) FILES
;; By default Emacs saves Backup Files under the original name with a tilde `~’ appended. 
;; To reallocate Emacs backup files (tilde ~) do:
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))) ;backup files will be saved in the directory "~/.emacs.d/backups/"
; (setq make-backup-files nil) ; stop creating backup~ files
; (setq auto-save-default nil) ; stop creating #autosave# files

;;; MAXIMIZE WINDOW
(add-to-list 'default-frame-alist '(fullscreen . maximized))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; MY CUSTOM INSTALLED PACKAGES PACKAGES

(add-to-list 'load-path "~/.emacs.d/lisp/") ;; ad one more path to the load-path variable


;;; TEMPLATES SUPPORT
;; NOTE: templates directory ~/.emacs.d/lisp/templates is HARD-CODED in package template.el
;; do not try to set up in any other directory
(require 'template)   ;; loads the template.el package in ~/.emacs.d/lisp/
(template-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; MARKDOWN
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/markdown-mode") ;; ad one more path to the load-path variable

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; rebind keys for the markdown mode
(defun mis-parrafos ()
  "For use in `markdown-mode-hook'."
  (local-set-key (kbd "M-n") 'forward-paragraph)   ;; paragraph up
  (local-set-key (kbd "M-p") 'backward-paragraph)  ;; paragraph up
  )
;; add to hook
(add-hook 'markdown-mode-hook 'mis-parrafos)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; R & ESS

;; NOTES FROM THE README IN THE ZIP DOWNLOAD

;; 1.5 Installation
;; ================

;;   1. Download the latest zip or tgz archive from ESS downloads area
;;      (http://ess.r-project.org/index.php?Section=download) and unpack it
;;      into a directory where you would like ESS to reside.  We will
;;      denote this directory as '/path/to/ESS/' hereafter.

;;      Alternatively you can use 'git' to fetch the most recent
;;      development version to your local machine with:

;;           git clone https://github.com/emacs-ess/ESS.git /path/to/ESS

;;   2. Optionally, compile elisp files and build the documentation with:
;;           cd /path/to/ESS/
;;           make
;;      Without this step, info, pdf and html documentation and reference
;;      card will not be available.

;;   3. Optionally, install into your local machine with 'make install'.
;;      You might need administrative privileges:

;;           make install

;;      The files are installed into '/usr/share/emacs' directory.  For
;;      this step to run correctly on Mac OS X, you will need to adjust the
;;      'PREFIX' path in 'Makeconf'.  The necessary code and instructions
;;      are commented in that file.

;;   4. If you have performed the 'make install' step from above, just add

;;           (require 'ess-site)

;;      to your '~/.emacs' file.  Otherwise, you should add
;;      '/path/to/ESS/lisp/' to your emacs load path and then load ESS with
;;      the following lines in your '~/.emacs':

;;           (add-to-list 'load-path "/path/to/ESS/lisp/")
;;           (load "ess-site")

;;   5. Restart your Emacs and check that ESS was loaded from a correct
;;      location with 'M-x ess-version'.

;;    _Note for Windows and Mac OS X users:_ The most straightforward way
;; to install Emacs on your machine is by downloading all-in-one
;; (http://vgoulet.act.ulaval.ca/en/emacs/) Emacs binary by Vincent Goulet.


(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/ESS/lisp") ;; ad one more path to the load-path variable
(load "ess-site")  ;; THIS ADDS 0.7 sec to the starting... see if could be changed by autoload

; (setq split-width-threshold nil) ;; split horizontally
;; (add-to-list 'auto-mode-alist '("\\.Rout" . (read-only-mode R-mode)))  ;; add a list of modes to Rout files... I should not need this with ESS ???

;; NOTE: currently this is working for all type of files... see how to set it just for R mode
;;
;; shortcut for pipes %>%
(defun R_operator_pipe ()
  "R - %>% operator or  pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
  (just-one-space 1)
  ;;(reindent-then-newline-and-indent)
  )
(global-set-key (kbd "M-5") 'R_operator_pipe)
;;
;; shortcut for pipes %in%
(defun R_operator_in ()
  "R - %in% operator or in operator"
  (interactive)
  (just-one-space 1)
  (insert "%in%")
  (just-one-space 1)
  ;;(reindent-then-newline-and-indent)
  )
(global-set-key (kbd "M-i") 'R_operator_in)

;; eval R up to the cursor
(global-set-key (kbd "C-c C-m") 'ess-eval-buffer-from-beg-to-here)


;; ;(define-key R-mode (kbd "M-%") 'then_R_operator)
;; ;(define-key ess-mode-map (kbd "C-5") 'then_R_operator)
;; ;(define-key inferior-ess-mode-map (kbd "C-%") 'then_R_operator)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; R & markdown : POLYMODE

;; add paths
(setq load-path
      (append '("~/.emacs.d/downloaded_from_github/polymode/"  "~/.emacs.d/downloaded_from_github/poly-markdown")
              load-path))

;;Require any polymode bundles that you are interested in. For example:
(require 'poly-markdown)

;; R modes extensions
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown-mode))

;; polymode-insert-new-chunk implementation from
;; https://github.com/vspinu/polymode/issues/123
(defun polymode-insert-new-chunk ()
  (interactive)
  (insert "\n```{r}\n")
  (save-excursion
    (newline)
    (insert "```\n")
    (previous-line)))

(global-set-key (kbd "M-k") 'polymode-insert-new-chunk)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; SET MY KEY SHORTCUTS
;;  NOTE: I do it at the end so that they overwrite other possible configurations
(set-default 'truncate-lines t)
;(global-set-key (kbd "C-c v") 'visual-line-mode)
(global-set-key (kbd "C-c C-v") 'visual-line-mode)


;;; MY KEY BINDINGS
(global-set-key (kbd "M-n") 'forward-paragraph)   ;; paragraph up
(global-set-key (kbd "M-p") 'backward-paragraph)  ;; paragraph up


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; AUTO COMPLETE
;; paths
(setq load-path
      (append '("~/.emacs.d/downloaded_from_github/popup-el/"
		"~/.emacs.d/downloaded_from_github/auto-complete/")
              load-path))
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; (setq ac-auto-start 1) do not enable ac, we are using company-mode!
;(define-key ac-complete-mode-map "\t" 'ac-complete)  ;; PARECE QUE NO HACE FALTA. REVISAR ESTO
(define-key ac-complete-mode-map "\r" nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; PYTHON

;; elpy dependency just for the configuration ??? may be I do not need it
(setq load-path
      (append '("~/.emacs.d/downloaded_from_github/exec-path-from-shell/")
	      load-path))

(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "PATH") ;; exec-path-from-shell (must go before elpy for ipython)

;; all elpy dependencies
(setq load-path
      (append '("~/.emacs.d/downloaded_from_github/exec-path-from-shell/"
		"~/.emacs.d/downloaded_from_github/s.el/"
		"~/.emacs.d/downloaded_from_github/pyvenv/"
		"~/.emacs.d/downloaded_from_github/company-mode/"
		"~/.emacs.d/downloaded_from_github/Highlight-Indentation-for-Emacs/"
		"~/.emacs.d/downloaded_from_github/yasnippet/"
                "~/.emacs.d/downloaded_from_github/find-file-in-project/"
		"~/.emacs.d/downloaded_from_github/elpy/")
              load-path))
(require 'elpy)

(setq elpy-remove-modeline-lighter nil) ;; do not hide modeline, call before elpy-enable

(elpy-enable)

(setq elpy-rpc-backend "jedi")
(setq elpy-shell-use-project-root nil) ;; If this variable is set to nil, the current directory is used as default directory when starting a Python shells.

;; (define-key elpy-mode-map (kbd "C-c C-n") 'elpy-shell-send-current-statement)
(define-key elpy-mode-map (kbd "C-c C-n") 'elpy-shell-send-statement-and-step)
(define-key elpy-mode-map (kbd "C-c C-b") 'elpy-shell-send-region-or-buffer)
(define-key elpy-mode-map (kbd "C-c C-r") 'elpy-shell-send-region-or-buffer)


;; python version (interpreter)

;; (setq python-shell-interpreter "python2"
;;       python-shell-interpreter-args "-i")

;; (setq python-shell-interpreter "python3"
;;       python-shell-interpreter-args "-i")

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;(setq elpy-rpc-python-command "python2")
; (setq elpy-rpc-python-command "pyspark")

;; (when (executable-find "pyspakr")
;; ;  (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;;   (elpy-use-ipython "pyspark"))

;; (when (executable-find "ipython3")
;;   (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;;   (elpy-use-ipython "ipython3"))

;; (when (executable-find "ipython2")
;;   (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;;   (elpy-use-ipython "ipython2"))

;; ;;(setq elpy-modules nil)
;; (setq elpy-modules elpy-mode)

;; ;;(elpy-enable)
;; ;;(elpy-enable)
;; ;;(add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))  ;; no se por que necesito esto


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SCALA

;; (setq load-path
;;       (append '("~/.emacs.d/downloaded_from_github/dash.el/"
;; 		"~/.emacs.d/downloaded_from_github/emacs-scala-mode/"
;; 		"~/.emacs.d/downloaded_from_github/emacs-sbt-mode"
;; 		"~/.emacs.d/downloaded_from_github/ensime-emacs/")
;; 	      load-path))

; (require 'ensime)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; JSON
;; find shortcuts here:
;; https://github.com/joshwnj/json-mode
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/json-reformat")
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/json-mode")
; (require 'json-mode)

(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/hierarchy")
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/json-navigator")
; (require 'json-navigator)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.
;; ;; You may delete these explanatory comments.
;; (package-initialize)

;; (load "~/.emacs.d/my-loadpackages.el")
;; ;; (add-hook 'after-init-hook '(lambda ()
;; ;; 			      (load "~/.emacs.d/my-noexternals.el")))


;; ;; SCROLLING IN TERM
;; (if (eq window-system nil)
;;     (let ((map (make-sparse-keymap)))
;;       (define-key input-decode-map "\e[1;5A" [C-up])
;;       (define-key input-decode-map "\e[1;5B" [C-down])
;;       (define-key input-decode-map "\e[1;5C" [C-right])
;;       (define-key input-decode-map "\e[1;5D" [C-left])))

;; ;; ;; LINUM
;; ;; (global-linum-mode t) ;; enable line numbers globally
;; ;; (require 'linum-off)


;; ;; ;; conkeror
;; ;; (if (executable-find "conkeror")
;; ;;     (progn (setq browse-url-generic-program (executable-find "conkeror"))
;; ;;            (setq browse-url-browser-function 'browse-url-generic)))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (browse-url-dwim yafolding json-mode polymode markdown-mode ess zenburn-theme web-mode sphinx-doc solarized-theme scss-mode rvm readline-complete py-autopep8 magit flycheck exec-path-from-shell elpy ein better-defaults auto-complete auctex))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;JSON
;; ;; start yafolding-mode for JSON files
;; (add-hook 'json-mode-hook
;;           (lambda () (yafolding-mode)))


;; ;;; browse urls
;; (require 'browse-url-dwim)      ; load library
;; (browse-url-dwim-mode 1)        ; install aliases and keybindings

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(column-number-mode t)
;;  '(cua-mode t nil (cua-base))
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; YAML
;; https://www.emacswiki.org/emacs/YamlMode
(add-to-list 'load-path "~/.emacs.d/downloaded_from_github/yaml-mode") ;; ad one more path to the load-path variable
(require 'yaml-mode)

;; (add-hook 'yaml-mode-hook
;;           (lambda ()
;;             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ??? not sure if this is interesting or not
;; enable all disabled commands in Emacs such as downcase-region 
;; https://stackoverflow.com/questions/10026221/enable-all-disabled-commands-permanently
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; some shortcuts
; (global-set-key (kbd "C-M-c") 'comment-region)
; (global-set-key (kbd "C-M-u") 'uncomment-region)
(global-set-key (kbd "M-c") 'comment-region)
(global-set-key (kbd "M-u") 'uncomment-region)
