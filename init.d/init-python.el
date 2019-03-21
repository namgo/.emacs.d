(setq py-python-command "python3")
(setq python-shell-interpreter "python3")

(add-hook 'python-mode-hook 'anaconda-mode)

;; (use-package python-docstring
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'python-docstring-mode))

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
  (add-to-list 'company-backends 'company-anaconda))

(use-package python
  :after (anaconda-mode flycheck)
  :config
  (defun custom-python-mode-hook ()
    (flycheck-mode)
    (setq fill-column 99)
    (unless (file-remote-p default-directory)
      (anaconda-mode 1)
      (anaconda-eldoc-mode 1)
      (flycheck-mode 1))))


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


(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(provide 'init-python)
