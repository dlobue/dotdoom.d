(defvar doom-private-override-dir (expand-file-name "override" doom-private-dir)
  "This directory is for your personal configuration.")


(when (file-exists-p doom-private-override-dir)
  (message "Loading personal configuration files in %s..." doom-private-override-dir)
  (mapc 'load (directory-files doom-private-override-dir 't "^[^#].*el$")))

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 140))

; doom-init-ui-hook
; doom-unicode-font
; doom-variable-pitch-font
; doom-big-font
; doom-font
; doom-theme

(setq scroll-margin 3
      tab-width 4
      user-full-name "Dominic LoBue"
      user-mail-address "dominic.lobue@gmail.com")


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


;(setq frame-background-mode "dark")
;(disable-theme 'zenburn)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
;(load-theme 'black-mustang t) ;; gvim theme
;(load-theme 'noctilux t) ;; lighttable theme
(load-theme 'bubbleberry t) ;; lighttable theme

;; lang/org
(setq org-directory (expand-file-name "~/docs/notes/org/")
      org-agenda-files (list org-directory)
      org-ellipsis " ▼ "

      ;; The standard unicode characters are usually misaligned depending on the
      ;; font. This bugs me. Personally, markdown #-marks for headlines are more
      ;; elegant.
      org-bullets-bullet-list '("#"))


