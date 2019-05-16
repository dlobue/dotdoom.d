(defun lisp-table-to-org-table (table &optional function)
  "Convert a lisp table to `org-mode' syntax, applying FUNCTION to each of its elements.
  The elements should not have any more newlines in them after
  applying FUNCTION ; the default converts them to spaces. Return
  value is a string containg the unaligned `org-mode' table."
  (unless (functionp function)
    (setq function (lambda (x) (replace-regexp-in-string "\n" " " x))))
  (mapconcat (lambda (x)                ; x is a line.
               (concat "| " (mapconcat function x " | ") " |"))
             table "\n"))

(defun csv-to-table (beg end &optional separator)
  "Convert from BEG to END (a region in csv format) to an
  `org-mode' table."
  (interactive
    (list
      (region-beginning)
      (region-end)
      (when current-prefix-arg
        (string-to-char (read-from-minibuffer "Separator? ")))))
  (require 'pcsv)
  (insert
    (lisp-table-to-org-table
      (let ((pcsv-separator (or separator pcsv-separator)))
        (pcsv-parse-region beg end))))
  (delete-region beg end)
  (org-table-align))

(defun insert-csv-as-table (filename &optional separator)
  "Insert a csv file as a org-mode table."
  (interactive
    (list
      (read-file-name "CSV file: ")
      (when current-prefix-arg
        (string-to-char
          (read-from-minibuffer "Separator? ")))))
  (csv-to-table (point)
                (progn (forward-char
                         (cadr (insert-file-contents filename)))
                       (point))
                separator))
