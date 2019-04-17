
;; stop shr (html email renderer for emails) from using background color
;; source: https://ryuslash.org/tag/gnus.html

(defun oni:shr-colorize-remove-last-arg (args)
  "If ARGS has more than 3 items, remove the last one."
  (if (> (length args) 3)
      (butlast args)
    args))

(with-eval-after-load 'shr
  (advice-add #'shr-colorize-region :filter-args
              #'oni:shr-colorize-remove-last-arg))


