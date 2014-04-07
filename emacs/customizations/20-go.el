;;; go --- Summary
;;; Commentary:
;;; Code:
(require 'auto-complete)
(require 'auto-complete-config)
(require 'go-mode-load)
(require 'go-autocomplete)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key "\C-c\C-r" 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key "\C-ci" 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 4)))
(add-hook 'before-save-hook 'gofmt-before-save)
(provide '20-go)
;;; 20-go.el ends here
