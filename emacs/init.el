(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

;; (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
;;       backup-by-copying      t  ; Don't de-link hard links
;;       version-control        t  ; Use version numbers on backups
;;       delete-old-versions    t  ; Automatically delete excess backups:
;;       kept-new-versions      20 ; how many of the newest versions to keep
;;       kept-old-versions      5) ; and how many of the old

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one solauch instance.
;;  ;; If there is more than one, they won't work right.
;;  '(coffee-tab-width 2)
;;  '(flycheck-clang-language-standard "c++11")
;;  '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-font-lock turn-on-haskell-doc-mode imenu-add-menubar-index)))
;;  '(linum-format (quote dynamic))
;;  '(org-agenda-files (quote ("~/Org/partiii.org" "~/Org/tulloch.org")))
;;  '(py-mark-decorators t)
;;  '(reftex-label-alist (quote (("defn" 100 "defn:%F:" "~\\ref{%s}" nil ("defn")) ("thm" 100 "thm:%F:" "~\\ref{%s}" nil ("thm")) ("exmp" 100 "exmp:%F:" "~\\ref{%s}" nil ("exmp")))))
;;  '(safe-local-variable-values (quote ((outline-minor-mode) (buffer-file-coding-system . utf-8-unix) (whitespace-line-column . 80) (lexical-binding . t))))
;;  '(vc-annotate-background nil)
;;  '(vc-annotate-color-map (quote ((20 . "#ff9da4") (40 . "#ffc58f") (60 . "#ffeead") (80 . "#d1f1a9") (100 . "#99ffff") (120 . "#bbdaff") (140 . "#ebbbff") (160 . "#ff9da4") (180 . "#ffc58f") (200 . "#ffeead") (220 . "#d1f1a9") (240 . "#99ffff") (260 . "#bbdaff") (280 . "#ebbbff") (300 . "#ff9da4") (320 . "#ffc58f") (340 . "#ffeead") (360 . "#d1f1a9"))))
;;  '(vc-annotate-very-old-color nil))

;; (put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
