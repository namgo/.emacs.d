;; reduce number of bell rings
(setq ring-bell-function 
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))
;; smooth scrolling
(setq scroll-conservatively 10000
scroll-preserve-screen-position 1)

(use-package ace-window
  :ensure t
  :bind ("C-," . ace-select-window)
  ("C-<" . ace-delete-window)
)
(provide 'init-ui)
