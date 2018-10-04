(setq py-python-command "python3")
;;(defun my/python-mode-hook ()
  ;;(add-to-list 'company-backends 'company-jedi))

;;(add-hook 'python-mode-hook 'my/python-mode-hook)
;;(require 'auto-virtualenv)
;;(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
(use-package virtualenvwrapper)
(use-package company-jedi             ;;; company-mode completion back-end for Python JEDI
  :config
  ;;(setq jedi:environment-virtualenv (list (expand-file-name "~/.python-environments/")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi))
(provide 'init-python)
