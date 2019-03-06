(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

;;; esc quits
(global-set-key [escape] 'evil-exit-emacs-state)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; \\ to escape insert mode!
; no work
;(key-chord-define evil-insert-state-map "\\\\" 'evil-normal-state)

(global-evil-leader-mode)
(evil-mode t)
(evil-leader/set-key
  "e" 'projectile-find-file
  "b" 'projectile-switch-to-buffer
  "k" 'kill-buffer)
