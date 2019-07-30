(use-package lispy
  :ensure t
  :after (lispyville)
  :hook (lispyville-mode)
  :config
  (setq lispy-close-quotes-at-end-p t)
  (add-hook 'emacs-lisp-mode-hook 'lispy-mode))
(use-package lispyville
  :ensure t
  :config
  :bind (:map lispyville-mode-map ("M-(" . lispyville-wrap-round)
	 ("M-[" . lispyville-wrap-brackets)
	 ("M-{" . lispyville-wrap-braces)))

(require 'init-lisp-clojure)
(provide 'init-lisp)
