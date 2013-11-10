(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(flycheck-clang-language-standard "c++11")
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-font-lock turn-on-haskell-doc-mode imenu-add-menubar-index)))
 '(linum-format (quote dynamic))
 '(org-agenda-files (quote ("~/Org/partiii.org" "~/Org/tulloch.org")))
 '(reftex-label-alist (quote (("defn" 100 "defn:%F:" "~\\ref{%s}" nil ("defn")) ("thm" 100 "thm:%F:" "~\\ref{%s}" nil ("thm")) ("exmp" 100 "exmp:%F:" "~\\ref{%s}" nil ("exmp")))))
 '(safe-local-variable-values (quote ((outline-minor-mode) (buffer-file-coding-system . utf-8-unix) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
