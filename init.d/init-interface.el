;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(tool-bar-mode -1)                              ;; no toolbar
(menu-bar-mode -1)                              ;; no menu bar
(scroll-bar-mode -1) ;; no scrollbar
(column-number-mode 1)                          ;; Gives column and line
(global-linum-mode 1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))


(provide 'init-interface)
