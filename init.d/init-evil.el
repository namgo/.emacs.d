(use-package pass)
(use-package evil
  :config
  (evil-mode 1)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'pass-mode 'emacs)
  (evil-set-initial-state 'pass-view-mode 'emacs)
  (evil-set-initial-state 'cider-repl-mode 'emacs))
(use-package evil-leader
  :init
  (global-evil-leader-mode 1)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "s" 'pass
    "b" 'switch-to-buffer
    "w" 'save-buffer
    "e" 'eshell
    "g" 'magit-status
    "pw" 'pyvenv-workon
    "pc" 'pyvenv-create
    "cv" 'cider-start-http-server
    "cr" 'cider-refresh
    "cu" 'cider-user-ns
    ))
(use-package evil-surround
  :init
  (global-evil-surround-mode 1))
(provide 'init-evil)
