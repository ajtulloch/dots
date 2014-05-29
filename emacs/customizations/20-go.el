;;; go --- Summary
;;; Commentary:
;;; Code:
(require 'auto-complete)
(require 'auto-complete-config)
(require 'go-mode-load)
(require 'go-autocomplete)

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            ;; Turn off highlighting for tabs.
            ;; (whitespace-toggle-options 'face)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'before-save-hook 'gofmt-before-save)
(provide '20-go)
;;; 20-go.el ends here
