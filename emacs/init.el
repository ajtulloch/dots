(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-doc-mode (lambda nil (ghc-init) (flymake-mode)))) t)
 '(linum-format (quote dynamic))
 '(org-agenda-files (quote ("~/Org/partiii.org" "~/Org/tulloch.org")))
 '(reftex-label-alist (quote (("defn" 100 "defn:%F:" "~\\ref{%s}" nil ("defn")) ("thm" 100 "thm:%F:" "~\\ref{%s}" nil ("thm")) ("exmp" 100 "exmp:%F:" "~\\ref{%s}" nil ("exmp")))))
 '(safe-local-variable-values (quote ((buffer-file-coding-system . utf-8-unix) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )