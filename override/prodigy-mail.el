(after! prodigy
  (prodigy-define-service
    :name "mailsync"
    :command "goimapnotify"
    :args '("-conf" ".config/imap_inotify/scalyr.conf")
    :cwd (expand-file-name "~")
    :tags '(mbsync email work)
    ; :kill-process-buffer-on-stop t
    )
)
