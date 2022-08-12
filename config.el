(defvar doom-private-override-dir (expand-file-name "override" doom-private-dir)
  "This directory is for your personal configuration.")

(when (file-exists-p doom-private-override-dir)
  (message "Loading personal configuration files in %s..." doom-private-override-dir)
  (mapc 'load (directory-files doom-private-override-dir 't "^[^#].*elc?$")))

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
      package-native-compile t
      confirm-emacs-kill nil
      ;; don't update the clipboard unless I do so specifically
      select-enable-clipboard nil
      doom-leader-key "\\"
      doom-localleader-key "\\m"
      company-idle-delay nil
      user-full-name "Dominic LoBue"
      user-mail-address "dominic.lobue@gmail.com"
      ; doom-font (font-spec :family "Source Code Pro" :size 12 :weight 'semi-light)
      doom-font (font-spec :family "Source Code Pro")
      doom-variable-pitch-font (font-spec :family "Source Code Pro")
      doom-unicode-font (font-spec :family "Source Code Pro")
      doom-big-font (font-spec :family "Source Code Pro"))

;(setq frame-background-mode "dark")
;(disable-theme 'zenburn)
(add-to-list 'custom-theme-load-path (expand-file-name "themes" doom-private-dir))
(add-to-list 'load-path (expand-file-name "themes" doom-private-dir))
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
;(load-theme 'black-mustang t) ;; gvim theme
;(load-theme 'noctilux t) ;; lighttable theme

; (load-theme 'bubbleberry t) ;; lighttable theme
