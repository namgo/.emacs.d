(defun mdn-search (searchString)
  "Open a browser on the MDN page for SEARCHSTRING."
  (interactive (list (read-string "Search: " (thing-at-point 'symbol))))
  (browse-url (format "https://developer.mozilla.org/en-US/search?q=%s&topic=js" searchString)))

(use-package js2-mode
  :after (npm-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode))
  :hook (npm-mode)
  :bind
  (:map js2-mode-map ("C-c m" . mdn-search)))

(use-package tern
  :ensure t)

(use-package npm-mode
  :ensure t)
(use-package indium
  :ensure t 
  :config
  (setq indium-chrome-executable "chromium-browser"))
;; add key bindings
  ;; (add-hook 'indium-client-connected-hook 'indium-interaction-mode)
(provide 'init-web-js)
