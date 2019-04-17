
(require 'paredit)
(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'lisp-mode-hook 'evil-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook 'evil-paredit-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook 'evil-paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook 'evil-paredit-mode)


;; old
;(add-hook 'cider-repl-mode-hook 'paredit-mode)
;(add-hook 'cider-repl-mode-hook 'evil-paredit-mode)
;(add-hook 'clojure-mode-hook 'evil-paredit-mode)
;(add-hook 'cider-mode-hook 'paredit-mode)
;(add-hook 'cider-mode-hook 'evil-paredit-mode)
