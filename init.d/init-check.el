(require 'init-check-python)

(use-package flycheck
  :init
  (global-flycheck-mode)
  :hook (flycheck-virtualenv-setup))

(provide 'init-check)
