;; THEME

;; (load-theme 'wombat t) (set-cursor-color "#bb1515") ;; red   cursor. Needs to be set AFTER loading the theme.
;; (load-theme 'wombat t) (set-cursor-color "#ffffff") ;; white cursor. Needs to be set AFTER loading the theme.
;; (load-theme 'deeper-blue t) (custom-set-faces '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 110 :width normal)))))

;; (load-theme 'leuven t) (custom-set-faces '(default ((t (:height 160))))) ;; big font white background for presentations

(load-theme 'deeper-blue t)
(set-cursor-color "#bb1515") ;; red cursor color

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 110 :width normal))))
 '(ediff-even-diff-A ((t (:background "dark slate blue"))))
 '(ediff-even-diff-B ((t (:background "dark slate blue"))))
 '(ediff-odd-diff-A ((t (:background "dark blue"))))
 '(ediff-odd-diff-B ((t (:background "dark blue"))))
 '(ido-subdir ((t (:foreground unspecified))))
 '(mode-line-buffer-id ((t (:background unspecified :foreground unspecified)))))


;; BASIC CUSTOMIZATION
(setq ispell-dictionary "american")
;; (setq ispell-dictionary "castellano8")

;; (global-auto-revert-mode t)  ;; auto-refresh all buffers when files have changed on disk

;; (menu-bar-mode -1)                 ;; disable menu bar
(tool-bar-mode -1)                    ;; disable toolbar completely
(scroll-bar-mode -1)
(column-number-mode t)
(cua-mode t)                          ;; copy paste with C-c C-v
(put 'upcase-region 'disabled nil)    ;; enable upcase region
(put 'downcase-region 'disabled nil)  ;; enable downcase region
(defalias 'yes-or-no-p 'y-or-n-p)     ;; short yes no

(setq inhibit-startup-message t)   ;; Hide the startup message
(setq ring-bell-function 'ignore)  ;; Disable sound notifications
(setq make-backup-files nil)       ;; Stop creating backup~ files
(setq auto-save-default nil)       ;; Stop creating #autosave# files
(setq split-height-threshold nil)  ;; Split Buffers Side-by-Side - No vertical splitting
(setq split-width-threshold 0)     ;; Split Buffers Side-by-Side - Allow horizontal splitting

(setq-default indent-tabs-mode nil)      ;; use spaces instead of tabs when indenting
(setq-default parens-require-spaces nil) ;; do not insert space before the parentheses when using the function "insert-parentheses"

(set-default 'truncate-lines t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))  ;; maximize window. Use maximized instead of fullboth so that the ubuntu tool bar is still active.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The :init section is used for code that should run before the package is loaded.
;; The :config section is for code that configures the package after it has been loaded.

;; PACKAGE - ELPA - MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)


;; GPTEL
;; Load environment variables (getenv)
(use-package load-env-vars
  :ensure t
  :config
  (load-env-vars "~/.env"))

(use-package gptel
  :ensure t
  :config
  (setq gptel-api-key (getenv "OPENAI_API_KEY")))


;; MARKDOWN
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :config
  (setq markdown-command "pandoc")
  (add-hook 'markdown-mode-hook
            (lambda ()
              (local-set-key (kbd "M-n") 'forward-paragraph)
              (local-set-key (kbd "M-p") 'backward-paragraph))))


;; DOCKER
(use-package dockerfile-mode
  :ensure t)


;; PYTHON
;; (use-package lsp-mode
;;   :ensure t
;;   :hook (python-mode . lsp-deferred)
;;   :commands (lsp lsp-deferred))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-shell-starting-directory 'current-directory)
  (setq python-indent-offset 4)
  (setq python-indent-guess-indent-offset-verbose nil)) ;; disable indentation guess message

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(add-hook 'python-mode-hook 'hs-minor-mode) ;; Enable code folding in Python

;; Keybindings for elpy
(define-key elpy-mode-map (kbd "C-c C-n") 'elpy-shell-send-statement-and-step)
(define-key elpy-mode-map (kbd "C-c C-b") 'elpy-shell-send-region-or-buffer)
(define-key elpy-mode-map (kbd "C-c C-r") 'elpy-shell-send-region-or-buffer)
(define-key elpy-mode-map (kbd "<backtab>") 'elpy-folding-hide-leafs)
(define-key elpy-mode-map (kbd "<C-tab>") 'elpy-folding-toggle-at-point)
(define-key elpy-mode-map (kbd "<C-fn>") 'hs-show-all)
(define-key elpy-mode-map (kbd "C-,") 'elpy-nav-indent-shift-left)
(define-key elpy-mode-map (kbd "C-.") 'elpy-nav-indent-shift-right)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;; TEMPLATES SUPPORT
;; ;; NOTE: templates directory ~/.emacs.d/lisp/templates is HARD-CODED in package template.el
;; ;; do not try to set up in any other directory
;; (add-to-list 'load-path "~/.emacs.d/lisp/") ;; ad one more path to the load-path variable
;; (require 'template)   ;; loads the template.el package in ~/.emacs.d/lisp/
;; (template-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-init ()
  "Open this init file"
  (interactive)
  (message user-init-file)
  (find-file user-init-file)
 )


(defun insert-quotes-double (&optional arg)
  "Enclose following ARG sexps in double quotes and move cursor to the end
or insert 2 double quotes and leave cursor in the middle."
  (interactive "*P")
  (let ((avance 0)) ;; Initialize `avance` to 0
    (when (use-region-p) ;; Check if a region is selected
      (setq avance (+ 1 (abs (- (region-end) (region-beginning)))))) ;; Calculate region length
    (insert-pair arg ?\" ?\") ;; Enclose in quotes
    (forward-char avance))) ;; Move cursor past the inserted quotes and selected text


(defun insert-quotes-single (&optional arg)
  "Enclose following ARG sexps in double quotes and move cursor to the end
or insert 2 double quotes and leave cursor in the middle."
  (interactive "*P")
  (let ((avance 0)) ;; Initialize `avance` to 0
    (when (use-region-p) ;; Check if a region is selected
      (setq avance (+ 1 (abs (- (region-end) (region-beginning)))))) ;; Calculate region length
    (insert-pair arg ?\' ?\') ;; Enclose in quotes
    (forward-char avance))) ;; Move cursor past the inserted quotes and selected text


(defun region ()
  "Display the beginning and end positions of the active region in a message."
  (interactive)
  (if (use-region-p)  ;; Check if a region is selected
      (let ((start (region-beginning))
            (end (region-end)))
        (message "Region starts at %d and ends at %d" start end))
    (message "No region selected.")))


(defun insert-header ()
  "Insert a header in script or file."
  (interactive)
  (beginning-of-buffer)
  (insert "# " (file-name-nondirectory buffer-file-name) "\n")
  (insert "# " (format-time-string "%Y-%m-%d") " david.montaner@gmail.com\n")
  (insert "# \n\n")
  (backward-char 2))


(defun insert-pandas-header ()
  "Insert the pandas header"
  (interactive)
  (insert
   "# np.set_printoptions(linewidth=173)\n"
   "# np.set_printoptions(threshold=sys.maxsize)\n"
   "pd.set_option('display.width', 173)\n"
   "pd.set_option('display.max_rows', 10)\n"
   "pd.set_option('display.max_columns', None)\n"
   "# pd.set_option('display.max_colwidth', 100)\n"
   "\n"
   "# matplotlib.rc('figure', figsize=[40, 20], dpi=200)\n"
   "# matplotlib.rc('figure', figsize=[20, 20])\n"
   "# matplotlib.rc('figure', autolayout=True)  # plt.tight_layout() set by default\n"
   "# plt.style.use('ggplot')\n"
   "# matplotlib.rc('font', size=20)\n"
   "# matplotlib.rcParams[\"figure.figsize\"]     # show params\n"
   "# matplotlib.rcParams[\"figure.autolayout\"]  # show params\n"
   ))

(defun insert-sep ()
  "Insert line of hash"
  (interactive)
  (make-string 80 ?X)
)

(defun insert-diary ()
  "Insert diary title"
  (interactive)
  (beginning-of-buffer)
  (insert "## " (format-time-string "%Y-%m-%d") "\n")
)

(defun insert-hash-and-pipe ()
  "Insert #| to be used when creating Jupyter Notebooks"
  (interactive)
  (insert "#| ")
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY BINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "M-c") 'comment-region)
(global-set-key (kbd "M-u") 'uncomment-region)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "C-M-0") 'toggle-truncate-lines)
(global-set-key (kbd "C-M-9") 'visual-line-mode)
(global-set-key (kbd "C-M-8") 'auto-fill-mode)  ;; I am not sure this is working


;; KEY BINDINGS to my own functions
(global-set-key (kbd "M-\'") 'insert-quotes-single)
(global-set-key (kbd "M-\"") 'insert-quotes-double)

(global-set-key (kbd "C-#") 'insert-sep)
;(global-set-key (kbd "C-|") 'insert-hash-and-pipe)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cypher-mode dockerfile-mode lsp-mode load-env-vars gptel elpy)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NEO4J
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun neo4j-shell ()
  "Start cypher-shell in a new Shell buffer."
  (interactive)
  ; (let ((default-directory "~/"))       ; Optional: Set a starting directory if needed
  (let ((current-dir default-directory))  ; Get the current working directory
    (shell "*cypher-shell*")              ; Create a new shell buffer named "*cypher-shell*"
    (comint-send-string "*cypher-shell*" "cypher-shell\n")))  ; Send the command to the shell

(defun neo4j-eshell ()
  "Start cypher-shell in a new EShell buffer."
  (interactive)
  (eshell)
  (insert "cypher-shell\n")  ;; Automatically run the command after EShell starts
  (eshell-send-input))

(use-package cypher-mode
  :ensure t
  )
