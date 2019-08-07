
(add-hook 'python-mode-hook 'anaconda-mode)

;; (use-package python-docstring
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'python-docstring-mode))

(use-package pippel
  :ensure t)

(use-package virtualenvwrapper
  :ensure t
  :init (setq venv-location "~/.virtualenvs/")
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package company-anaconda
  :ensure t
  :after (company anaconda-mode)
  :config
  (add-hook 'anaconda-mode-hook (lambda () (add-to-list 'company-backends 'company-anaconda))))

(use-package anaconda-mode
  :ensure t
  :config
  :hook (anaconda-eldoc-mode t)
  )

(use-package python
  :after (anaconda-mode flycheck-mode)
  :hook (anaconda-mode flycheck-mode)
  :config
  
  (setq py-python-command "python3")
  (setq python-shell-interpreter "python3"))



(provide 'init-python)
