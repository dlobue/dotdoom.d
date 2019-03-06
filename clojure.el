(require 'clojure-mode-extra-font-locking)
(require 'cider-eval-sexp-fu)

;; clojure
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'linum-mode)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-log-messages t)
;(add-hook 'cider-mode-hook 'subword-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(setq nrepl-hide-special-buffers t)
(setq cider-show-error-buffer nil)
(setq cider-prefer-local-resources t)
(setq cider-auto-select-error-buffer nil)
(setq cider-prompt-save-file-on-load nil)
(setq cider-lein-parameters "cider-repl")
;;(setq cider-lein-parameters "trampoline with-profile use-bootclasspath,repl-extra,cider repl :headless")
;;(setq cider-lein-parameters "with-profile repl-extra,cider repl :headless")

;; nicer font lock in REPL
(setq cider-repl-use-clojure-font-lock t)

;; nice pretty printing
(setq cider-repl-use-pretty-printing t)

;; looong history
(setq cider-repl-history-size 3000)


(add-hook 'clojure-mode-hook
	  (lambda ()
	    ;; add "-", "_", "?" to word constituent. without this emacs breaks
	    ;; words up into smaller words
	    (modify-syntax-entry ?_ "w" clojure-mode-syntax-table)
	    (modify-syntax-entry ?- "w" clojure-mode-syntax-table)
	    (modify-syntax-entry ?? "w" clojure-mode-syntax-table)
	    (modify-syntax-entry ?! "w" clojure-mode-syntax-table)))


;(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'evil-mode)

(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

;; --- Frenchie
;; General Auto-Complete
;(require 'auto-complete-config)
;(setq ac-delay 0.0)
;(setq ac-quick-help-delay 0.5)
;(ac-config-default)

;; Poping-up contextual documentation
;(eval-after-load "cider"
  ;'(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
;(global-rainbow-delimiters-mode)


;; --- hl-sexp

(require 'hl-sexp)

(add-hook 'clojure-mode-hook #'hl-sexp-mode)
(add-hook 'lisp-mode-hook #'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook #'hl-sexp-mode)

(add-hook 'clojure-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)


;; --- clj-refactor

(require 'clj-refactor)
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (clj-refactor-mode 1)
	    ;; insert keybinding setup here
	    (cljr-add-keybindings-with-prefix "C-c RET")
	    (yas/minor-mode 1)))

;; no auto sort
(setq cljr-auto-sort-ns nil)

;; warm artifact cache at REPL start up
(add-hook 'nrepl-connected-hook #'cljr-update-artifact-cache)

;; warm the AST cache at REPL start up
(add-hook 'nrepl-connected-hook #'cljr-warm-ast-cache)

