(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(elpy-enable)

(provide 'init-python)
