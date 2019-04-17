
(require 'thingatpt)
; (require 'cider-interaction)

(defun cider-this-sexp ()
  "Return the sexp preceding the point."
  (let ((bounds (if (char-equal ?( (following-char))
                  (bounds-of-thing-at-point 'sexp)
                  (save-excursion
                    (backward-up-list 1)
                    (bounds-of-thing-at-point 'sexp)))))
  (buffer-substring-no-properties
    (car bounds)
    (cdr bounds))))

;; NOTE: there are some macro expansion functions that still use cider-last-sexp


(defun cider-eval-this-sexp (&optional prefix)
  "Evaluate the expression preceding point.
If invoked with a PREFIX argument, print the result in the current buffer."
  (interactive "P")
  (cider-interactive-eval (cider-this-sexp)
                          (when prefix (cider-eval-print-handler))))

(defun cider-eval-this-sexp-and-replace ()
  "Evaluate the expression preceding point and replace it with its result."
  (interactive)
  (let ((this-sexp (cider-this-sexp)))
    ;; we have to be sure the evaluation won't result in an error
    (nrepl-sync-request:eval this-sexp)
    ;; seems like the sexp is valid, so we can safely kill it
    (backward-kill-sexp)
    (cider-interactive-eval this-sexp (cider-eval-print-handler))))

(defun cider-eval-this-sexp-to-repl (&optional prefix)
  "Evaluate the expression preceding point and insert its result in the REPL.
If invoked with a PREFIX argument, switch to the REPL buffer."
  (interactive "P")
  (cider-interactive-eval (cider-this-sexp)
                          (cider-insert-eval-handler (cider-current-repl-buffer)))
  (when prefix
    (cider-switch-to-repl-buffer)))

(defun cider-eval-print-this-sexp ()
  "Evaluate the expression preceding point.
Print its value into the current buffer."
  (interactive)
  (cider-interactive-eval (cider-this-sexp)
                          (cider-eval-print-handler)))

(defun cider-pprint-eval-this-sexp ()
  "Evaluate the sexp preceding point and pprint its value in a popup buffer."
  (interactive)
  (cider--pprint-eval-form (cider-this-sexp)))

(defun cider-insert-this-sexp-in-repl (&optional arg)
  "Insert the expression preceding point in the REPL buffer.
If invoked with a prefix ARG eval the expression after inserting it."
  (interactive "P")
  (cider-insert-in-repl (cider-this-sexp) arg))



(eval-after-load 'cider
   '(progn
     (define-key cider-mode-map (kbd "C-x C-e") #'cider-eval-this-sexp)
     (define-key cider-mode-map (kbd "C-c C-e") #'cider-eval-this-sexp)
     (define-key cider-mode-map (kbd "C-c C-w") #'cider-eval-this-sexp-and-replace)
     (define-key cider-mode-map (kbd "C-c M-e") #'cider-eval-this-sexp-to-repl)
     (define-key cider-mode-map (kbd "C-c M-p") #'cider-insert-this-sexp-in-repl)
     (define-key cider-mode-map (kbd "C-c C-p") #'cider-pprint-eval-this-sexp)))


