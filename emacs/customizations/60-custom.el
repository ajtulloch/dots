;;; Custom --- Summary
;;; Commentary:
;;; Code:
(setq custom-file "~/.emacs.d/customizations/60-custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-amsmath-label "eq:")
 '(LaTeX-command-style (quote (("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))))
 '(LaTeX-label-function (quote reftex-label))
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-command-list (quote (("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-master nil)
 '(TeX-parse-self t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server nil)
 '(TeX-view-program-list (quote (("OS X Preview" "open %o"))))
 '(TeX-view-program-selection (quote ((output-pdf "OS X Preview"))))
 '(ac-auto-start t)
 '(ac-quick-help-delay 0.5)
 '(ac-trigger-key "TAB")
 '(auto-save-default nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(dired-details-hidden-string "")
 '(dired-use-ls-dired nil)
 '(electric-indent-mode t)
 '(electric-layout-mode t)
 '(flx-ido-mode t)
 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint")
 '(flycheck-clang-language-standard "c++11")
 '(gist-view-gist nil)
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t nil (flycheck))
 '(global-rainbow-delimiters-mode t)
 '(global-whitespace-mode t)
 '(haskell-font-lock-symbols t)
 '(haskell-stylish-on-save t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(inferior-julia-program-name "julia")
 '(jedi:complete-on-dot t)
 '(jedi:setup-keys t)
 '(js2-basic-offset 2)
 '(keyfreq-autosave-mode t)
 '(keyfreq-mode t)
 '(magit-set-upstream-on-push (quote askifnotset))
 '(make-backup-files nil)
 '(markdown-css-path mkdown-css-file-name)
 '(markdown-reference-location (quote end))
 '(preview-TeX-style-dir "/Users/tulloch/Code/dots/emacs/.cask/24.3.1/elpa/auctex-11.87.4/latex")
 '(projectile-global-mode t)
 '(projectile-mode-line-lighter " ∫")
 '(projectile-use-git-grep t)
 '(py-split-windows-on-execute-p nil)
 '(reftex-label-alist (quote (("thm" nil nil nil nil nil -3))))
 '(reftex-plug-into-AUCTeX t)
 '(rng-nxml-auto-validate-flag nil)
 '(safe-local-variable-values (quote ((todo-categories "Todo") (flycheck-disabled-checkers (quote (emacs-lisp emacs-lisp-checkdoc))) (eval when (and (buffer-file-name) (file-regular-p (buffer-file-name)) (string-match-p "^[^.]" (buffer-file-name))) (emacs-lisp-mode) (when (fboundp (quote flycheck-mode)) (flycheck-mode -1)) (unless (featurep (quote package-build)) (let ((load-path (cons ".." load-path))) (require (quote package-build)))) (package-build-minor-mode)) (TeX-master . "master") (TeX-master . t) (whitespace-line-column . 80) (lexical-binding . t))))
 '(scala-indent:add-space-for-scaladoc-asterisk t)
 '(scala-indent:use-javadoc-style t)
 '(scalable-fonts-allowed t)
 '(scss-compile-at-save nil)
 '(smartparens-global-strict-mode t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 100
                    :weight 'light)

(provide '60-custom)
;;; 60-custom.el ends here
