
(use-package evil
  :config
  (evil-mode 1))
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "b" 'switch-to-buffer
   "w" 'save-buffer
   "e" 'eshell))
(provide 'init-evil)
