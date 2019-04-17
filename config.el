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

;(setq frame-background-mode "dark")
;(disable-theme 'zenburn)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
;(load-theme 'black-mustang t) ;; gvim theme
;(load-theme 'noctilux t) ;; lighttable theme
(load-theme 'bubbleberry t) ;; lighttable theme
