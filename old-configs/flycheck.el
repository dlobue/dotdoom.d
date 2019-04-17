
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))

(setq flycheck-idle-change-delay 3.0)

(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

