;;; cask-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (list-packages describe-package package-initialize
;;;;;;  package-install-file package-install-from-buffer package-install
;;;;;;  package-enable-at-startup) "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy"
;;;;;;  "package-legacy.el" "f21091396f5c5695e9c69574cd2ba1d5")
;;; Generated autoloads from package-legacy.el

(defvar package-enable-at-startup t "\
Whether to activate installed packages when Emacs starts.
If non-nil, packages are activated after reading the init file
and before `after-init-hook'.  Activation is not done if
`user-init-file' is nil (e.g. Emacs was started with \"-q\").

Even if the value is nil, you can type \\[package-initialize] to
activate the package system at any time.")

(custom-autoload 'package-enable-at-startup "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" t)

(autoload 'package-install "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Install the package named NAME.
Interactively, prompt for the package name.
The package is found on one of the archives in `package-archives'.

\(fn NAME)" t nil)

(autoload 'package-install-from-buffer "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Install a package from the current buffer.
When called interactively, the current buffer is assumed to be a
single .el file that follows the packaging guidelines; see info
node `(elisp)Packaging'.

When called from Lisp, PKG-INFO is a vector describing the
information, of the type returned by `package-buffer-info'; and
TYPE is the package type (either `single' or `tar').

\(fn PKG-INFO TYPE)" t nil)

(autoload 'package-install-file "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Install a package from a file.
The file can either be a tar file or an Emacs Lisp file.

\(fn FILE)" t nil)

(autoload 'package-initialize "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Load Emacs Lisp packages, and activate them.
The variable `package-load-list' controls which packages to load.
If optional arg NO-ACTIVATE is non-nil, don't activate packages.

\(fn &optional NO-ACTIVATE)" t nil)

(autoload 'describe-package "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Display the full documentation of PACKAGE (a symbol).

\(fn PACKAGE)" t nil)

(autoload 'list-packages "../../../../../Code/dots/emacs/.cask/24.3.1/elpa/cask-20140324.15/package-legacy" "\
Display a list of packages.
Fetches the updated list of packages before displaying.
The list is displayed in a buffer named `*Packages*'.

\(fn)" t nil)

(defalias 'package-list-packages 'list-packages)

;;;***

;;;### (autoloads (list-packages describe-package package-initialize
;;;;;;  package-install-file package-install-from-buffer package-install
;;;;;;  package-enable-at-startup) "package-legacy" "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/package-legacy.el"
;;;;;;  "f21091396f5c5695e9c69574cd2ba1d5")
;;; Generated autoloads from ../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/package-legacy.el

(defvar package-enable-at-startup t "\
Whether to activate installed packages when Emacs starts.
If non-nil, packages are activated after reading the init file
and before `after-init-hook'.  Activation is not done if
`user-init-file' is nil (e.g. Emacs was started with \"-q\").

Even if the value is nil, you can type \\[package-initialize] to
activate the package system at any time.")

(custom-autoload 'package-enable-at-startup "package-legacy" t)

(autoload 'package-install "package-legacy" "\
Install the package named NAME.
Interactively, prompt for the package name.
The package is found on one of the archives in `package-archives'.

\(fn NAME)" t nil)

(autoload 'package-install-from-buffer "package-legacy" "\
Install a package from the current buffer.
When called interactively, the current buffer is assumed to be a
single .el file that follows the packaging guidelines; see info
node `(elisp)Packaging'.

When called from Lisp, PKG-INFO is a vector describing the
information, of the type returned by `package-buffer-info'; and
TYPE is the package type (either `single' or `tar').

\(fn PKG-INFO TYPE)" t nil)

(autoload 'package-install-file "package-legacy" "\
Install a package from a file.
The file can either be a tar file or an Emacs Lisp file.

\(fn FILE)" t nil)

(autoload 'package-initialize "package-legacy" "\
Load Emacs Lisp packages, and activate them.
The variable `package-load-list' controls which packages to load.
If optional arg NO-ACTIVATE is non-nil, don't activate packages.

\(fn &optional NO-ACTIVATE)" t nil)

(autoload 'describe-package "package-legacy" "\
Display the full documentation of PACKAGE (a symbol).

\(fn PACKAGE)" t nil)

(autoload 'list-packages "package-legacy" "\
Display a list of packages.
Fetches the updated list of packages before displaying.
The list is displayed in a buffer named `*Packages*'.

\(fn)" t nil)

(defalias 'package-list-packages 'list-packages)

;;;***

;;;### (autoloads nil nil ("../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/cask-autoloads.el"
;;;;;;  "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/cask-bootstrap.el"
;;;;;;  "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/cask-cli.el"
;;;;;;  "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/cask-pkg.el"
;;;;;;  "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/cask.el"
;;;;;;  "../../../../../../../.emacs.d/.cask/24.3.1/elpa/cask-20140324.15/package-legacy.el"
;;;;;;  "package-legacy.el") (21313 53093 366194 0))

;;;***

(provide 'cask-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cask-autoloads.el ends here
