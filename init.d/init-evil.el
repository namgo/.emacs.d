(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'pass-mode 'emacs)
  (evil-set-initial-state 'pass-view-mode 'emacs)
  (evil-set-initial-state 'indium-repl-mode 'emacs)
  (evil-set-initial-state 'cider-repl-mode 'emacs))

;; evil leaders now set primarily within packages
;; for modes
;; r is the leading map for repl managers/evaluators
(use-package evil-leader
  :ensure t
  :init
  (global-evil-leader-mode 1)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "e" 'eshell
    ;; magit
    "g" 'magit-status
    ;; helm
    "f" 'helm-find-files
    "x" 'helm-M-x
    "a" 'helm-ag
    "y" 'helm-show-kill-ring
    )
  (evil-leader/set-key-for-mode 'clojure-mode "rl" 'namgo/cider-start-http-server)
  (evil-leader/set-key-for-mode 'clojure-mode "rr" 'namgo/cider-refresh)
  (evil-leader/set-key-for-mode 'clojure-mode "ru" 'namgo/cider-user-ns)
  (evil-leader/set-key-for-mode 'indium-mode "rl" 'indium-launch)
  (evil-leader/set-key-for-mode 'indium-mode "rr" 'indium-reload)
  (evil-leader/set-key-for-mode 'python-mode "pw" 'venv-workon)
  (evil-leader/set-key-for-mode 'python-mode "pc" 'venv-create)
  )
(use-package evil-surround
  :ensure t
  :init
  ;; (global-evil-surround-mode 1)
  )
(provide 'init-evil)
