(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))
(use-package js2-mode
  :config
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-jsx-mode)))

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.")
	("django"  . "\\.djhtml\\."))
)
(defun django-html-hook ()
  (setq engine web-mode-engine)
  (when (string-equal web-mode-engine "django")
    (electric-pair-local-mode 0)
    (message "TRUE")))
(add-hook 'web-mode-hook 'django-html-hook)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)
(add-hook 'js-jsx-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
 )
(use-package npm-mode
  :ensure t
  :config
  (add-hook 'js-mode-hook 'npm-mode))
(provide 'init-web)
