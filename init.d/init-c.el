(use-package company-irony
  :after (company irony)
  :ensure t)
(use-package irony
  :ensure t
  :hook ((c-mode . irony-mode)
	 (c++-mode . irony-mode)))

(provide 'init-c)
