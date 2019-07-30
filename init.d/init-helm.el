(use-package helm-config
  :ensure helm
  :config
  (helm-mode 1)
  (helm-adaptive-mode 1)
  ;;(helm-push-mark-mode 1)
  (setq helm-M-x-fuzzy-match t)
  (define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
  
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-mini)
   ("C-x C-f" . helm-find-files)
   ("M-y" . helm-show-kill-ring)))

(use-package helm-ag
  :ensure t)
(provide 'init-helm)
