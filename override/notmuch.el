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
                            ("alerts" . "tag:alerts")))


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

 ; (evil-set-initial-state 'notmuch-show-mode 'normal)
 ; (evil-set-initial-state 'notmuch-search-mode 'normal)
 ; (evil-set-initial-state 'notmuch-hello-mode 'normal)


 ;; below two blocks were commented out a LONG time ago

 ;(defun notmuch-get-date (date) "Converts a date for notmuch processing" (substring (shell-command-to-string (concat "date --date=\"" date "\" +%s")) 0 -1))
 ;(defun notmuch-today () "Shows today's mail" (interactive) (notmuch-search (concat (notmuch-get-date "today 0") ".." (notmuch-get-date "now"))))
 ;(defun notmuch-week () "Shows this week's mail" (interactive) (notmuch-search (concat (notmuch-get-date "last monday") ".." (notmuch-get-date "now"))))
 ;(defun notmuch-unread () "Shows unread mail" (interactive) (notmuch-search "tag:unread"))
 ;(defun notmuch-mt-lists () "Shows mt-lists unread mail" (interactive) (notmuch-search "tag:unread and tag:mt-lists"))

 ;(define-key notmuch-show-mode-map "d"
 ;(lambda ()
 ;(interactive)
 ;(notmuch-show-tag "+deleted")))
 ;(define-key notmuch-search-mode-map "d"
 ;(lambda ()
 ;(interactive)
 ;(notmuch-show-tag "+deleted")))




 (define-key notmuch-tree-mode-map [mouse-1] nil)
 (define-key notmuch-search-mode-map [mouse-1] nil)

 (evil-define-key 'normal notmuch-show-mode-map "=" 'notmuch-refresh-this-buffer)
 (evil-define-key 'normal notmuch-search-mode-map "=" 'notmuch-refresh-this-buffer)


 ; (let ((evil-notmuch-global-mode (lambda ()
 ;                                   (define-key evil-normal-state-local-map "m" 'notmuch-mua-new-mail)
 ;                                   (define-key evil-normal-state-local-map "=" 'notmuch-refresh-this-buffer))))
 ;   (add-hook 'notmuch-show-hook evil-notmuch-global-mode)
 ;   (add-hook 'notmuch-search-hook evil-notmuch-global-mode)
 ;   (add-hook 'notmuch-home-hook evil-notmuch-global-mode)
 ;   (add-hook 'notmuch-tree-hook evil-notmuch-global-mode))


 ;(define-key notmuch-show-mode-map "j" 'next-line)
 ;(define-key notmuch-show-mode-map "k" 'previous-line)
 ;(define-key notmuch-search-mode-map "j" 'next-line)
 ;(define-key notmuch-search-mode-map "k" 'previous-line)
 ;(define-key notmuch-show-mode-map "r" 'notmuch-show-reply)
 ;(define-key notmuch-show-mode-map "R" 'notmuch-show-reply-sender)
 ;(define-key notmuch-search-mode-map "r" 'notmuch-search-reply-to-thread)
 ;(define-key notmuch-search-mode-map "R" 'notmuch-search-reply-to-thread-sender)
 ;(define-key notmuch-show-mode-map ":" 'evil-ex)
 ;(define-key notmuch-search-mode-map ":" 'evil-ex)

 ;(define-key notmuch-search-mode-map (kbd "gg") 'notmuch-search-first-thread)
 ;(define-key notmuch-search-mode-map "G" 'notmuch-search-last-thread)
 ;(define-key notmuch-search-mode-map "\C-b" 'notmuch-search-scroll-down)
 ;(define-key notmuch-search-mode-map "\C-f" 'notmuch-search-scroll-up)
 ;;(define-key notmuch-search-mode-map (kbd "C-b") 'notmuch-search-scroll-down)
 ;;(define-key notmuch-search-mode-map (kbd "C-f") 'notmuch-search-scroll-up)


 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "x" 'notmuch-bury-or-kill-this-buffer)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "\C-b" 'notmuch-search-scroll-down)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "\C-f" 'notmuch-search-scroll-up)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "gg" 'notmuch-search-first-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "G" 'notmuch-search-last-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "k" 'notmuch-search-previous-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "j" 'notmuch-search-next-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "r" 'notmuch-search-reply-to-thread-sender)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "R" 'notmuch-search-reply-to-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "o" 'notmuch-search-toggle-order)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "t" 'notmuch-search-filter-by-tag)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "f" 'notmuch-search-filter)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "*" 'notmuch-search-tag-all)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "a" 'notmuch-search-archive-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "-" 'notmuch-search-remove-tag)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "+" 'notmuch-search-add-tag)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 (kbd "RET") 'notmuch-search-show-thread)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "Z" 'notmuch-tree-from-search-current-query)




 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "c" 'notmuch-search-stash-map)

 ;(evil-define-key 'normal notmuch-search-mode-map
 ;                 "i" 'notmuch-search-stash-thread-id)


 ;;; show mode

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "c" 'notmuch-show-stash-cc)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "d" 'notmuch-show-stash-date)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "F" 'notmuch-show-stash-filename)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "f" 'notmuch-show-stash-from)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "i" 'notmuch-show-stash-message-id)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "I" 'notmuch-show-stash-message-id-stripped)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "s" 'notmuch-show-stash-subject)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "T" 'notmuch-show-stash-tags)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "t" 'notmuch-show-stash-to)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "s" 'notmuch-show-save-part)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "o" 'notmuch-show-interactively-view-part)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "|" 'notmuch-show-pipe-part)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "Z" 'notmuch-tree-from-show-current-query)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "<C-tab>") 'widget-backward)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "M-TAB") 'notmuch-show-previous-button)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "<backtab>") 'notmuch-show-previous-button)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "TAB") 'notmuch-show-next-button)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "f" 'notmuch-show-forward-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "r" 'notmuch-show-reply-sender)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "R" 'notmuch-show-reply)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "|" 'notmuch-show-pipe-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "w" 'notmuch-show-save-attachments)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "c" 'notmuch-show-stash-map)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "*" 'notmuch-show-tag-all)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "-" 'notmuch-show-remove-tag)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "+" 'notmuch-show-add-tag)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "X" 'notmuch-show-archive-thread-then-exit)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "x" 'notmuch-show-archive-message-then-next-or-exit)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "A" 'notmuch-show-archive-thread-then-next)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "a" 'notmuch-show-archive-message-then-next-or-next-thread)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "N" 'notmuch-show-next-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "P" 'notmuch-show-previous-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "n" 'notmuch-show-next-open-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "p" 'notmuch-show-previous-open-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "M-n") 'notmuch-show-next-thread-show)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "M-p") 'notmuch-show-previous-thread-show)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "DEL") 'notmuch-show-rewind)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "M-RET") 'notmuch-show-open-or-close-all)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 (kbd "RET") 'notmuch-show-toggle-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "#" 'notmuch-show-print-message)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "!" 'notmuch-show-toggle-elide-non-matching)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "$" 'notmuch-show-toggle-process-crypto)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "<" 'notmuch-show-toggle-thread-indentation)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "t" 'toggle-truncate-lines)

 ;(evil-define-key 'normal notmuch-show-mode-map
 ;                 "." 'notmuch-show-part-map)

 ;(let ((evil-notmuch-global-mode 
 ;        (lambda ()
 ;          (define-key evil-normal-state-local-map
 ;                      "q" 'notmuch-bury-or-kill-this-buffer)
 ;          (define-key evil-normal-state-local-map
 ;                      "s" 'notmuch-search)
 ;          (define-key evil-normal-state-local-map
 ;                      "m" 'notmuch-mua-new-mail)
 ;          (define-key evil-normal-state-local-map
 ;                      "=" 'notmuch-refresh-this-buffer)
 ;          (define-key evil-normal-state-local-map
 ;                      "z" 'notmuch-tree)
 ;          )))
 ;  (add-hook 'notmuch-show-hook evil-notmuch-global-mode)
 ;  (add-hook 'notmuch-search-hook evil-notmuch-global-mode)
 ;  (add-hook 'notmuch-home-hook evil-notmuch-global-mode)
 ;  (add-hook 'notmuch-tree-hook evil-notmuch-global-mode)
 ;  )

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
