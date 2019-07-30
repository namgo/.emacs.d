(use-package org
  :config
  (setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (setq org-log-done 'time)
  (setq org-startup-indented t)
  (setq org-agenda-files (list "~/Documents/org"))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))
  :bind (("C-c a" . org-agenda)
	 (:map org-mode-map
	  ("M-q" . toggle-truncate-lines))))

(provide 'init-org)
