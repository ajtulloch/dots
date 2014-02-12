;;; python-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (python-mode) "python" "python.el" (21243 44468
;;;;;;  0 0))
;;; Generated autoloads from python.el

(add-to-list 'auto-mode-alist (cons (purecopy "\\.py\\'") 'python-mode))

(add-to-list 'interpreter-mode-alist (cons (purecopy "python") 'python-mode))

(autoload 'python-mode "python" "\
Major mode for editing Python files.

\\{python-mode-map}
Entry to this mode calls the value of `python-mode-hook'
if that value is non-nil.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("python-pkg.el") (21243 44468 259035 0))

;;;***

(provide 'python-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; python-autoloads.el ends here
