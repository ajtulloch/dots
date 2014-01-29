;;; cmake-project-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cmake-project-mode cmake-project-configure-project)
;;;;;;  "cmake-project" "cmake-project.el" (21208 65237 0 0))
;;; Generated autoloads from cmake-project.el

(autoload 'cmake-project-configure-project "cmake-project" "\
Configure or reconfigure a CMake build tree.
BUILD-DIRECTORY is the path to the build-tree directory.  If the
directory does not already exist, it will be created.  The source
directory is found automatically based on the current buffer.

\(fn BUILD-DIRECTORY GENERATOR)" t nil)

(autoload 'cmake-project-mode "cmake-project" "\
Minor mode that integrates a CMake-based project with Emacs
build tools such as the CompileCommand and Flymake.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("cmake-project-pkg.el") (21208 65238 3765
;;;;;;  0))

;;;***

(provide 'cmake-project-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cmake-project-autoloads.el ends here
