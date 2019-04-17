
;(require 'bbdb)
;(bbdb-initialize)
;(define-key mail-mode-map [tab] 'bbdb-complete-name)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq mm-text-html-renderer 'gnus-w3m)
(setq sendmail-program "/usr/bin/msmtp")

;; This is needed to allow msmtp to do its magic:
(setq message-sendmail-f-is-evil 't)

;;need to tell msmtp which account we're using
(setq message-sendmail-extra-arguments '("--read-envelope-from"))

;;need to tell msmtp which account we're using
;(setq message-sendmail-extra-arguments '("-a" "anderson"))
;; you might want to set the following too
;(setq mail-host-address "gmail.com")

