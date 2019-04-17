(require 'dizzee)

(dz-defservice offlineimap "offlineimap"
                         :args ("-a" "revup"))

(evil-set-initial-state 'comint-mode 'normal)

(set-popup-rules!
  '(("^\\*offlineimap" :modeline nil :transient nil :ttl nil)))
