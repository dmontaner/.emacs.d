(setq inhibit-startup-message t)    ;; Hide the startup message
(setq ring-bell-function 'ignore)   ;; Disable sound notifications
(setq make-backup-files nil)        ;; Stop creating backup~ files
(setq auto-save-default nil)        ;; Stop creating #autosave# files
(setq-default indent-tabs-mode nil) ;; use spaces instead of tabs when indenting
(defalias 'yes-or-no-p 'y-or-n-p)   ;; short yes no
(column-number-mode t)	            ;; include column number
(menu-bar-mode -1)                  ;; disable menu bar (File, Edit, View...)
(tool-bar-mode -1)                  ;; disable toolbar completely (Open, Save, Undo...)
