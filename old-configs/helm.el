(require 'helm)
(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)

;(setq helm-split-window-in-side-p t)

(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)


(setq helm-dash-docsets-path "/root/.local/share/Zeal/Zeal/docsets")
(setq helm-dash-browser-func 'eww)

