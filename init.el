(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))


(package-initialize)


;; load custom file 
(setq custom-file "~/.emacs.d/custom.el")

(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))

(load custom-file)

;; initialize PATH
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

;; Put backup files neatly away                                                 
(let ((backup-dir "~/.emacs.d/backups")
      (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks                           
      delete-old-versions t  ; Clean up the backups                             
      version-control t      ; Use version numbers on backups,                  
      kept-new-versions 5    ; keep some new versions                           
      kept-old-versions 2)   ; and some old ones, too                           


(use-package company-irony
  :after (company irony)
  :ensure t)
(use-package irony
  :ensure t
  :hook ((c-mode . irony-mode)
	 (c++-mode . irony-mode)))




(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :hook (flycheck-virtualenv-setup))

(declare-function python-shell-calculate-exec-path "python3")
(defun flycheck-virtualenv-executable-find (executable)
  "Find an EXECUTABLE in the current virtualenv if any."
  (if (bound-and-true-p python-shell-virtualenv-root)
      (let ((exec-path (python-shell-calculate-exec-path)))
	(executable-find executable))
    (executable-find executable)))

(defun flycheck-virtualenv-setup ()
  "Setup Flycheck for the current virtualenv."
  (setq-local flycheck-executable-find #'flycheck-virtualenv-executable-find))


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


;; (use-package evil
;;   :ensure t
;;   :config
;;   (evil-mode 1)
;;   (evil-set-initial-state 'eshell-mode 'emacs)
;;   (evil-set-initial-state 'pass-mode 'emacs)
;;   (evil-set-initial-state 'pass-view-mode 'emacs)
;;   (evil-set-initial-state 'indium-repl-mode 'emacs)
;;   (evil-set-initial-state 'cider-repl-mode 'emacs))

;; ;; evil leaders now set primarily within packages
;; ;; for modes
;; ;; r is the leading map for repl managers/evaluators
;; (use-package evil-leader
;;   :ensure t
;;   :init
;;   (global-evil-leader-mode 1)
;;   :config
;;   (evil-leader/set-leader "<SPC>")
;;   (evil-leader/set-key
;;     "e" 'eshell
;;     ;; magit
;;     "g" 'magit-status
;;     ;; helm
;;     "f" 'helm-find-files
;;     "x" 'helm-M-x
;;     "a" 'helm-ag
;;     "y" 'helm-show-kill-ring
;;     )
;;   (evil-leader/set-key-for-mode 'clojure-mode "rl" 'namgo/cider-start-http-server)
;;   (evil-leader/set-key-for-mode 'clojure-mode "rr" 'namgo/cider-refresh)
;;   (evil-leader/set-key-for-mode 'clojure-mode "ru" 'namgo/cider-user-ns)
;;   (evil-leader/set-key-for-mode 'indium-mode "rl" 'indium-launch)
;;   (evil-leader/set-key-for-mode 'indium-mode "rr" 'indium-reload)
;;   (evil-leader/set-key-for-mode 'python-mode "pw" 'venv-workon)
;;   (evil-leader/set-key-for-mode 'python-mode "pc" 'venv-create)
;;   )
;; (use-package evil-surround
;;   :ensure t
;;   :init
;;   ;; (global-evil-surround-mode 1)
;;   )

(use-package magit
  :ensure t)
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

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(tool-bar-mode -1)                              ;; no toolbar
(menu-bar-mode -1)                              ;; no menu bar
(scroll-bar-mode -1) ;; no scrollbar
(column-number-mode 1)                          ;; Gives column and line
(global-linum-mode 1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))



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
  
  ;; Use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode)))


(use-package lispy
  :ensure t
  :init (add-hook 'emacs-lisp-mode-hook 'lispy-mode)
  :config
  (setq lispy-close-quotes-at-end-p t))




(use-package org
  :config
  (setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (setq org-log-done 'time)
  (setq org-startup-indented t)
  (setq org-agenda-files (list "~/Documents/org"))
  (setq org-default-notes-file "~/Documents/org/journal.org.gpg")
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/org/tasks.org.gpg" "Tasks")
         "* TODO %?\n  %i\n")
        ("j" "Journal" entry (file+datetree "~/Documents/org/journal.org.gpg")
         "* %?\nEntered on %U\n  %i\n")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))
  :bind (("C-c a" . org-agenda)
	 ("C-c o" . org-capture)
	 (:map org-mode-map
	       ("M-q" . toggle-truncate-lines))))

(use-package undo-tree
  :init (global-undo-tree-mode t))
(use-package smartparens
  :ensure t)
(use-package rainbow-delimiters
  :ensure t
  :hook
  (
   (lispy-mode . rainbow-delimiters-mode)
   (js2-mode . rainbow-delimiters-mode)))



(add-hook 'python-mode-hook 'anaconda-mode)

;; (use-package python-docstring
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'python-docstring-mode))

(use-package pippel
  :ensure t)

(use-package virtualenvwrapper
  :ensure t
  :init (setq venv-location "~/.virtualenvs/")
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package company-anaconda
  :ensure t
  :after (company anaconda-mode)
  :config
  (add-hook 'anaconda-mode-hook (lambda () (add-to-list 'company-backends 'company-anaconda))))

(use-package anaconda-mode
  :ensure t
  :config
  :hook (anaconda-eldoc-mode t)
  )

(use-package python
  :after (anaconda-mode flycheck-mode)
  :hook (anaconda-mode flycheck-mode)
  :config
  
  (setq py-python-command "python3")
  (setq python-shell-interpreter "python3"))




(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("php"    . "\\.phtml\\'")
	  ("php"    . "\\.php\\'")
	  ("blade"  . "\\.blade\\.")
	  ("django"  . "\\.djhtml\\."))))


;; (defun django-html-hook ()
;;   (setq engine web-mode-engine)
;;   (when (string-equal web-mode-engine "django")
;;     (electric-pair-local-mode 0)
;;     (message "TRUE")))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  )





(defun mdn-search (searchString)
  "Open a browser on the MDN page for SEARCHSTRING."
  (interactive (list (read-string "Search: " (thing-at-point 'symbol))))
  (browse-url (format "https://developer.mozilla.org/en-US/search?q=%s&topic=js" searchString)))

(use-package js2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'npm-mode)
;  (add-to-list 'company-backends 'company-tern)
  :bind
  (:map js2-mode-map ("C-c m" . mdn-search)))

(use-package tern
  :ensure t)

;; (use-package company-tern
;;   :ensure t
;;   :init
;;   (setq company-tooltip-align-annotations t))

(use-package npm-mode
  :ensure t)
(use-package indium
  :ensure t 
  :config
  (setq indium-chrome-executable "chromium-browser"))
;; add key bindings
;; (add-hook 'indium-client-connected-hook 'indium-interaction-mode)

(use-package epa-file
  :init (epa-file-enable))

(defun js-method-p ()
  (save-excursion
    (word-search-backward "function")
    (looking-back ": ")))

(defun js-function-declaration-p ()
  (save-excursion
    (word-search-backward "function")
    (looking-back "^\\s *")))

(defun snippet--function-punctuation ()
  (if (js-method-p)
      (when (not (looking-at "[ \n\t\r]*[},]"))
        (insert ","))
    (unless (js-function-declaration-p)
      (if (looking-at "$") (insert ";")))))

(defun snippet--function-name ()
  (if (js-function-declaration-p) "name" ""))

;;; clojure

(defun snippet--clojure-namespace-from-buffer-file-name ()
  (replace-regexp-in-string "_" "-"
   (replace-regexp-in-string "/" "."
    (chop-prefix "test/"
    (chop-prefix "src/"
    (chop-suffix ".clj"
     (substring (buffer-file-name) (length eproject-root))))))))

(defun snippet--clojure-namespace-under-test ()
  (replace-regexp-in-string "-test" "" (snippet--clojure-namespace-from-buffer-file-name)))

;; snippet-helper-helpers

(defun chop-suffix (suffix s)
  "Remove string 'suffix' if it is at end of string 's'"
  (let ((pos (- (length suffix))))
    (if (and (>= (length s) (length suffix))
             (string= suffix (substring s pos)))
        (substring s 0 pos)
      s)))

(defun chop-prefix (prefix s)
  "Remove string 'prefix' if it is at start of string 's'"
  (let ((pos (length prefix)))
    (if (and (>= (length s) (length prefix))
             (string= prefix (substring s 0 pos)))
        (substring s pos)
      s)))


