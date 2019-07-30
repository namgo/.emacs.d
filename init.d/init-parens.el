(use-package smartparens
  :ensure t)
(use-package rainbow-delimiters
  :ensure t
  :hook
  (
   (lispy-mode . rainbow-delimiters-mode)
   (js2-mode . rainbow-delimiters-mode)))

(provide 'init-parens)
