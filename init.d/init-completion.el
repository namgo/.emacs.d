;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179


(use-package company
  :ensure t
  :init
  (setq company-global-modes '(not cider-repl-mode eshell-mode))
  (global-company-mode 1)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  ;;:bind (:map company-minor-mode-map ("C-c y" . yas-expand))
  )
(use-package company-quickhelp
  :ensure t
  :config (company-quickhelp-mode 1))

;; (use-package yasnippet
;;   :ensure t
;;   :init
;;   (add-to-list 'company-backends 'company-yasnippet)

;;   :bind (:map yas-minor-mode-map ("C-c y" . yas-expand)))


(provide 'init-completion)
