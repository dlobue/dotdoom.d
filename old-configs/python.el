
(elpy-enable)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'pyenv-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'evil-text-object-python-add-bindings)
(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'company-backends '(company-jedi company-files))))
