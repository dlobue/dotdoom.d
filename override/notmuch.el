;;; my-notmuch.el -- my notmuch mail configuration
;;;

;;; add here stuff required to be configured *before*
;;; notmuch is loaded;

;; uncomment and modify in case some elisp files are not found in load-path
;; (add-to-list 'load-path "~/vc/ext/notmuch/emacs")

;;; load notmuch
;(require 'notmuch)

;;; add here stuff required to be configured *after*
;;; notmuch is loaded;

;; uncomment & modify if you want to use external smtp server to send mail
;; (setq smtpmail-smtp-server "smtp.server.tld"
;;       message-send-mail-function 'message-smtpmail-send-it)
;; uncomment to debug smtp sending problems
;; (setq smtpmail-debug-info t)

(after! notmuch

 (setq
   +notmuch-sync-backend nil
   notmuch-message-headers-visible t
   notmuch-search-oldest-first nil
   notmuch-search-result-format '(("date" . "%12s ")
                                  ("authors" . "%-20s ")
                                  ("tags" . "(%s) ")
                                  ("subject" . "%s"))
   notmuch-saved-searches '(("inbox" . "tag:inbox date:today_-_one_month..")
                            ("unread" . "tag:inbox AND tag:unread")
                            ("security" . "tag:security")
                            ("alerts" . "tag:alerts date:today_-_one_week..")))


 (add-hook 'notmuch-show-hook
           (lambda ()
             (setq notmuch-tag-formats
                   '(("unread" (propertize tag 'face '(:foreground "red")))
                     ("flagged" (propertize tag 'face '(:foreground "blue"))
                      (notmuch-tag-format-image-data tag (notmuch-tag-star-icon)))))
             ))

 (add-hook 'notmuch-search-hook
           (lambda ()
             (setq size-indication-mode nil)
             (setq notmuch-tag-formats
                   '(("unread" nil)
                     ("inbox" nil)
                     ("signed" nil)
                     ("attachment" nil)
                     ("flagged" (propertize tag 'face '(:foreground "blue"))
                      (notmuch-tag-format-image-data tag (notmuch-tag-star-icon)))))
             ))


 (remove-hook 'notmuch-show-mode-hook #'+notmuch|center-window)


 (define-key notmuch-tree-mode-map [mouse-1] nil)
 (define-key notmuch-search-mode-map [mouse-1] nil)

 (evil-define-key 'normal notmuch-show-mode-map "=" 'notmuch-refresh-this-buffer)
 (evil-define-key 'normal notmuch-search-mode-map "=" 'notmuch-refresh-this-buffer)

 (evil-ex-define-cmd "notmuch-subkeymap-help" 'notmuch-subkeymap-help)
 (evil-ex-define-cmd "notmuch-help" 'notmuch-help)

 (evil-ex-define-cmd "notmuch-refresh-this-buffer" 'notmuch-refresh-this-buffer)
 (evil-ex-define-cmd "nmu" 'notmuch-unread)
 (evil-ex-define-cmd "nmt" 'notmuch-today)
 (evil-ex-define-cmd "nmw" 'notmuch-week)

 (evil-define-command evil-nms (&optional query) (interactive "<a>") (notmuch-search query))

 (evil-ex-define-cmd "nms" 'evil-nms)
 (evil-ex-define-cmd "nmc" 'notmuch-mua-new-mail)
 (evil-ex-define-cmd "nm" 'notmuch)
)
