
(use-package yasnippet
	     :init
	     (yas-global-mode 1))
(use-package company
	     :init
	     (global-company-mode 1)
	     :config
	     (setq company-dabbrev-downcase 0)
	     (setq company-idle-delay 0))
(use-package company-quickhelp
  :config (company-quickhelp-mode 1))
(use-package company-irony)
(use-package irony)
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))
(electric-pair-mode)
(provide 'init-completion)
