(use-package smartparens)
(use-package rainbow-delimiters
  :hook
  (
   (lispy-mode . rainbow-delimiters-mode)
   (js2-mode . rainbow-delimiters-mode)))

(provide 'init-parens)
