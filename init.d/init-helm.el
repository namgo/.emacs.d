(use-package helm-config
  :ensure helm
  :config
  (helm-mode 1)
  (helm-adaptive-mode 1)
  ;;(helm-push-mark-mode 1)
  (setq helm-M-x-fuzzy-match t)
  (define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
  (evil-leader/set-key
    "f" 'helm-find-files
    "x" 'helm-M-x
    "a" 'helm-ag
    "y" 'helm-show-kill-ring))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(use-package helm-ag)
(provide 'init-helm)
