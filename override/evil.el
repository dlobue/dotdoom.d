(def-package-hook! evil
   :post-init
   ;; Remove package-menu from the evil disabled list so it uses custom evil
   ;; mode mappings.
   (delq! 'buff-menu +evil-collection-disabled-list)
   (delq! 'package-menu +evil-collection-disabled-list))
