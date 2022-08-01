(after! prodigy
  (prodigy-define-service
    :name "mailsync-scalyr"
    :command "goimapnotify"
    :args '("-conf" ".config/imapnotify/scalyr.conf")
    :cwd (expand-file-name "~")
    :tags '(mbsync email work scalyr))

  (prodigy-define-service
    :name "mailsync-sentinelone"
    :command "goimapnotify"
    :args '("-conf" ".config/imapnotify/sentinelone.conf")
    :cwd (expand-file-name "~")
    :tags '(mbsync email work sentinelone)
    :on-output (lambda (&rest args)
                 (let ((output (plist-get args :output)))
                   (when (s-matches? "refresh notmuch" output)
                     (notmuch-refresh-all-buffers))))))
