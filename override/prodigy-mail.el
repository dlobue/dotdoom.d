(after! prodigy
  (prodigy-define-service
    :name "mailsync-scalyr"
    :command "goimapnotify"
    :args '("-conf" ".config/imapnotify/scalyr.conf")
    :cwd (expand-file-name "~")
    :tags '(mbsync email work scalyr)
    ; :kill-process-buffer-on-stop t
    )
  (prodigy-define-service
    :name "mailsync-sentinelone"
    :command "goimapnotify"
    :args '("-conf" ".config/imapnotify/sentinelone.conf")
    :cwd (expand-file-name "~")
    :tags '(mbsync email work sentinelone)
    ; :kill-process-buffer-on-stop t
    )
)
