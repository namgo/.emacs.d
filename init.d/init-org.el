(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
(setq org-startup-indented t)
(define-key org-mode-map "\M-q" 'toggle-truncate-lines)
(provide 'init-org)