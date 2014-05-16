;;; Misc --- Summary
;;; Commentary:
;;; Code:


(add-hook 'ruby-mode-hook 'iy-tab-noconflict)
;; (add-hook 'markdown-mode-hook 'iy-tab-noconflict)

;; (defun markdown-unset-tab ()
;;   "markdown-mode-hook."
;;   (define-key markdown-mode-map (kbd "<tab>") nil))

;; (add-hook 'markdown-mode-hook '(lambda () (markdown-unset-tab)))

(add-hook 'markdown-mode-hook '(lambda ()
                                 ;; (setq yas/fallback-behavior
                                 ;;       '(apply 'original-command))
                                 (setq paragraph-start "\\*\\|$"
                                       paragraph-separate "$")
                                 (local-set-key [tab] 'yas/expand)))

(add-hook 'org-mode-hook 'iy-tab-noconflict)
(add-hook 'org-mode-hook 'iy-tab-noconflict)
(add-hook 'haskell-mode-hook 'iy-tab-noconflict)
;; (add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
;; (add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)


;;; 50-misc ends here
