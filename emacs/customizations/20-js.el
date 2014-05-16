;;; js --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (auto-fill-mode -1)))

(provide '20-js)
;;; 20-js.el ends here
