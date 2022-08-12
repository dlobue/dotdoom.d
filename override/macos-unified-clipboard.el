;;; override/macos-unified-clipboard.el -*- lexical-binding: t; -*-

(eval-when! IS-MAC
  (defadvice! +evil-get-selection-mac (args)
    "There is no primary clipboard on a mac, so just redirect requests for it to the CLIPBOARD"
    :filter-args #'gui-get-selection
    (cons 'CLIPBOARD (cdr args)))

  (defadvice! +evil-set-selection-mac (args)
    "There is no primary clipboard on a mac, so just redirect requests for it to the CLIPBOARD"
    :filter-args #'gui-set-selection
    (cons 'CLIPBOARD (cdr args))))
