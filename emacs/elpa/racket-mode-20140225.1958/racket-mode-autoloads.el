;;; racket-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (racket-repl racket-mode) "racket-mode" "racket-mode.el"
;;;;;;  (21268 53653 0 0))
;;; Generated autoloads from racket-mode.el

(add-to-list 'hs-special-modes-alist '(racket-mode "(" ")" ";" nil nil))

(autoload 'racket-mode "racket-mode" "\
Major mode for editing Racket.
\\{racket-mode-map}

\(fn)" t nil)

(setq auto-mode-alist (append '(("\\.rkt\\'" . racket-mode) ("\\.rktd\\'" . racket-mode)) auto-mode-alist))

(autoload 'racket-repl "racket-mode" "\
Run a Racket REPL in a comint buffer.
Runs the hook `racket-repl-mode-hook' (after the `comint-mode-hook'
is run).

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("racket-keywords-and-builtins.el" "racket-mode-pkg.el")
;;;;;;  (21268 53653 464929 0))

;;;***

(provide 'racket-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; racket-mode-autoloads.el ends here
