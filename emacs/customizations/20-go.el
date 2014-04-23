;;; go --- Summary
;;; Commentary:
;;; Code:
(require 'auto-complete)
(require 'auto-complete-config)
(require 'go-mode-load)
(require 'go-autocomplete)

(add-hook 'go-mode-hook
          (lambda ()
            (set-variable tab-width 4)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'before-save-hook 'gofmt-before-save)
(provide '20-go)
;;; 20-go.el ends here
