(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(require 'use-package)
(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'init-evil)
(require 'init-helm)
(require 'init-python)
(require 'init-completion)	 
(require 'init-ui)
(require 'init-web)
(use-package magit)
(setq auto-save-default nil)
(setq make-backup-files nil)
(put 'erase-buffer 'disabled nil)
(tool-bar-mode -1)                              ;; no toolbar
(menu-bar-mode -1)                              ;; no menu bar
(scroll-bar-mode -1) ;; no scrollbar
;; turn off sctartup screen
(column-number-mode 1)                          ;; Gives column and line
(global-linum-mode 1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq line-number-display-limit-width 2000000) ;; prevents ?? for line numbers
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
