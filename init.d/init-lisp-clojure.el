(defun namgo/cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun namgo/cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun namgo/cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))


(defun namgo/cider-set-repl ()
  (setq inferior-lisp-program "lein repl")
  (font-lock-add-keywords
   nil
   '(("(\\(facts?\\)"
      (1 font-lock-keyword-face))
     ("(\\(background?\\)"
      (1 font-lock-keyword-face))))
  (define-clojure-indent (fact 1))
  (define-clojure-indent (facts 1)))

(use-package clojure-mode
  :ensure t
  :after cider
  :config
  ;; NOTE: these key maps are not actually used that often
  ;; maybe switch them?
  (add-hook 'clojure-mode-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-cider)
	      (lispy-mode t)
	      (cider-mode t)
	      (namgo/cider-add-company-backend)
	      (namgo/cider-set-repl)
	      )))


(use-package cider
  :ensure t
  :config
  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t)
  (add-hook 'cider-mode-hook 'eldoc-mode)
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
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode)))

(provide 'init-lisp-clojure)
