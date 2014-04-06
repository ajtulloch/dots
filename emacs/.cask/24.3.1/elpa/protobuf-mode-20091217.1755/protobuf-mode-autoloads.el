;;; protobuf-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (protobuf-mode) "protobuf-mode" "protobuf-mode.el"
;;;;;;  (21313 51427 0 0))
;;; Generated autoloads from protobuf-mode.el
 (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

(autoload 'protobuf-mode "protobuf-mode" "\
Major mode for editing Protocol Buffers description language.

The hook `c-mode-common-hook' is run with no argument at mode
initialization, then `protobuf-mode-hook'.

Key bindings:
\\{protobuf-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("protobuf-mode-pkg.el") (21313 51427 354954
;;;;;;  0))

;;;***

(provide 'protobuf-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; protobuf-mode-autoloads.el ends here
