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

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
