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

 (set-popup-rule! "^\\*notmuch" :ignore t)
 ; (setq-hook! 'notmuch-search-mode-hook display-buffer-alist nil)
 ; (remove-hook 'notmuch-show-mode-hook #'+notmuch|center-window)
 ; (set-popup-rule! (lambda (buf-name action)
 ;                    (string= "notmuch-show-mode" (with-current-buffer buf-name major-mode))) :ignore t)

  (set-popup-rule! "^\\*subject:" :size 0.8 :ttl 0)
  (defadvice! +notmuch-search-show-thread-a (fn &rest args)
              :around #'notmuch-search-show-thread
              (letf! (defun notmuch-show (thread-id &optional elide-toggle parent-buffer query-context buffer-name)
                       (funcall notmuch-show
                                thread-id elide-toggle parent-buffer query-context
                                (format "*subject:%s*" (substring buffer-name 1 -1))))
                     (apply fn args)))


 (setq
   +notmuch-sync-backend nil
   notmuch-tree-show-out t  ; hopefully prevents showing emails in split pane
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
