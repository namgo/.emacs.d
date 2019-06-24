(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
(use-package org
  :config
  (setq org-log-done 'time)
  (setq org-startup-indented t)
  (setq org-agenda-files (list "~/Documents/org"))
  :bind (("C-c a" . org-agenda)
	 ("M-q" . toggle-truncate-lines))
  )
(provide 'init-org)
