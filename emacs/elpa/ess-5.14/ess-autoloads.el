;;; ess-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (Rd-mode) "ess-rd" "../../../../../.emacs.d/elpa/ess-5.14/ess-rd.el"
;;;;;;  "c048c46bced5b6144a2a7a3532f5c74d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ess-5.14/ess-rd.el

(autoload 'Rd-mode "ess-rd" "\
Major mode for editing R documentation source files.

This mode makes it easier to write R documentation by helping with
indentation, doing some of the typing for you (with Abbrev mode) and by
showing keywords, strings, etc. in different faces (with Font Lock mode
on terminals that support it).

Type \\[list-abbrevs] to display the built-in abbrevs for Rd keywords.

Keybindings
===========

\\{Rd-mode-map}

Variables you can use to customize Rd mode
==========================================

`Rd-indent-level'
  Indentation of Rd code with respect to containing blocks.
  Default is 2.

Turning on Rd mode runs the hook `Rd-mode-hook'.

To automatically turn on the abbrev(iate) features, add the
following lines to your `.emacs' file:

  (add-hook 'Rd-mode-hook
	    (lambda ()
	      (abbrev-mode 1)))

\(fn)" t nil)

;;;***

;;;### (autoloads (mouse-me) "mouseme" "../../../../../.emacs.d/elpa/ess-5.14/mouseme.el"
;;;;;;  "cc4ec6a4f1884d7db02040b99b442359")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ess-5.14/mouseme.el

(autoload 'mouse-me "mouseme" "\
Popup a menu of functions to run on selected string or region.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ess-5.14/ess-arc-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-bugs-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-bugs-l.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-comp.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-compat.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-custom.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-dde.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-debug.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-eldoc.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-font-lock.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-help.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-inf.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-install.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-jags-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-lsp-l.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-menu.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-mode.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-mous.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-mouse.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-noweb.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-omg-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-omg-l.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-pkg.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-r-a.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-r-args.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-r-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-r-gui.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-rd.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-rdired.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-roxy.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-rutils.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-s-l.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-s3-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-s4-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sas-a.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-sas-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sas-l.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-send.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-send2.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-site.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sp3-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-sp4-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sp5-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-sp6-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sp6w-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-sta-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-sta-l.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-swv.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-toolbar.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-trns.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-utils.el" "../../../../../.emacs.d/elpa/ess-5.14/ess-vst-d.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/ess-xls-d.el" "../../../../../.emacs.d/elpa/ess-5.14/ess.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/essd-els.el" "../../../../../.emacs.d/elpa/ess-5.14/make-regexp.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/mouseme.el" "../../../../../.emacs.d/elpa/ess-5.14/msdos.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/noweb-font-lock-mode.el"
;;;;;;  "../../../../../.emacs.d/elpa/ess-5.14/noweb-mode.el") (21119
;;;;;;  31023 737928 0))

;;;***

(provide 'ess-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ess-autoloads.el ends here
