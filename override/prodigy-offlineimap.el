(after! prodigy
  (prodigy-define-service
   :name "OfflineIMAP"
   :command "offlineimap"
   :args '("-a" "revup")
   :cwd (expand-file-name "~")
   :tags '(offlineimap email work)
   ; :kill-process-buffer-on-stop t
   ))

