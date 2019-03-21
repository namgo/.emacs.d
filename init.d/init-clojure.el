;;(use-package rainbow-delimeters
;; :ensure t)

(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'lispy-mode)
  (rainbow-delimiters-mode)
  )
(use-package lispyville
  :ensure t
  :config
  (add-hook 'lispy-mode-hook #'lispyville-mode)
  :bind ("M-(" . lispyville-wrap-round)
	  ("M-[" . lispyville-wrap-brackets)
	  ("M-{" . lispyville-wrap-braces))

(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(defun cider-add-company-backend ()
  (add-to-list 'company-backends '(company-cider)))
  

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'lispy-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'clojure-mode-hook 'cider-add-company-backend)
  (add-hook 'clojure-mode-hook
	    (lambda ()
	      (setq inferior-lisp-program "lein repl")
	      (font-lock-add-keywords
	       nil
	       '(("(\\(facts?\\)"
		  (1 font-lock-keyword-face))
		 ("(\\(background?\\)"
		  (1 font-lock-keyword-face))))
	      (define-clojure-indent (fact 1))
	      (define-clojure-indent (facts 1)))))


(use-package cider
  :ensure t
  :config
  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t)

  ;; When there's a cider error, show its buffer and switch to it
  (setq cider-show-error-buffer t)
  (setq cider-auto-select-error-buffer t)

  ;; Where to store the cider history.
  (setq cider-repl-history-file "~/.emacs.d/cider-history")

  ;; Wrap when navigating history.
  (setq cider-repl-wrap-history t)

  ;; enable paredit in your REPL
  (add-hook 'cider-repl-mode-hook 'lispyville-mode)

  ;; Use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
  (add-hook 'cider-mode-hook 'eldoc-mode))

(provide 'init-clojure)
