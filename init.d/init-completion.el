
(use-package yasnippet
	     :init
	     (yas-global-mode 1))
(use-package company
	     :init
	     (global-company-mode 1)
	     :config
	     (setq company-idle-delay 0.3))
(use-package company-quickhelp
  :config (company-quickhelp-mode 1))
(use-package company-irony)
(use-package irony)
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))
(provide 'init-completion)
