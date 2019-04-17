(def-package-hook! evil
   :post-init
   ;; Remove package-menu from the evil disabled list so it uses custom evil
   ;; mode mappings.
   (delq! 'package-menu +evil-collection-disabled-list))
