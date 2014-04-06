;;; simple-rtm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (display-simple-rtm-tasks-mode simple-rtm-mode)
;;;;;;  "simple-rtm" "simple-rtm.el" (21313 51402 0 0))
;;; Generated autoloads from simple-rtm.el
 (put 'simple-rtm-mode-line-string 'risky-local-variable t)

(autoload 'simple-rtm-mode "simple-rtm" "\
An interactive \"do everything right now\" mode for Remember The Milk

Display all of your lists and tasks in a new buffer or switch to
that buffer if it already exists.

Each action will be sent to the Remember The Milk web interface
immediately.

\\{simple-rtm-mode-map}

\(fn)" t nil)

(defvar display-simple-rtm-tasks-mode nil "\
Non-nil if Display-Simple-Rtm-Tasks mode is enabled.
See the command `display-simple-rtm-tasks-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `display-simple-rtm-tasks-mode'.")

(custom-autoload 'display-simple-rtm-tasks-mode "simple-rtm" nil)

(autoload 'display-simple-rtm-tasks-mode "simple-rtm" "\
Display SimpleRTM task statistics in the mode line.
The text being displayed in the mode line is controlled by the variables
`simple-rtm-mode-line-format'.
The mode line will be updated automatically when a task is modified.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("rtm.el" "simple-rtm-pkg.el") (21313 51402
;;;;;;  493660 0))

;;;***

(provide 'simple-rtm-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; simple-rtm-autoloads.el ends here
