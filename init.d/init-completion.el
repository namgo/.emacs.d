(use-package yasnippet
  :ensure t
	     :init
	     (yas-global-mode 1))
(use-package company
  :ensure t
	     :init
	     (setq company-global-modes '(not cider-repl-mode eshell-mode))
	     (global-company-mode 1)
	     :config
	     (setq company-dabbrev-downcase 0)
	     (setq company-idle-delay 0))
(use-package company-quickhelp
  :ensure t
  :config (company-quickhelp-mode 1))
(use-package company-irony
  :ensure t)
(use-package irony
  :ensure t)

(use-package company-tern
  :ensure t
  :init
  (add-to-list 'company-backends 'company-tern)
  (setq company-tooltip-align-annotations t))

(provide 'init-completion)
