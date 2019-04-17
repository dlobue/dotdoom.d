;; lang/org
(setq org-directory (expand-file-name "~/docs/notes/org/")
      org-agenda-files (list org-directory)
      org-ellipsis " ▼ "

      ;; The standard unicode characters are usually misaligned depending on the
      ;; font. This bugs me. Personally, markdown #-marks for headlines are more
      ;; elegant.
      ; org-bullets-bullet-list '("#")
      )
