;;; flycheck-color-mode-line-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (flycheck-color-mode-line-mode) "flycheck-color-mode-line"
;;;;;;  "flycheck-color-mode-line.el" (21118 59449 0 0))
;;; Generated autoloads from flycheck-color-mode-line.el

(autoload 'flycheck-color-mode-line-mode "flycheck-color-mode-line" "\
Minor mode to color the mode line with the Flycheck status.
 
When called interactively, toggle
`flycheck-color-mode-line-mode'.  With prefix ARG, enable
`flycheck-color-mode-line-mode' if ARG is positive, otherwise
disable it.
 
When called from Lisp, enable `flycheck-color-mode-line-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-color-mode-line-mode'.
Otherwise behave as if called interactively.

\(fn &optional ARG)" t nil)

(custom-add-frequent-value 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

;;;***

;;;### (autoloads nil nil ("flycheck-color-mode-line-pkg.el") (21118
;;;;;;  59450 1809 0))

;;;***

(provide 'flycheck-color-mode-line-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-color-mode-line-autoloads.el ends here
