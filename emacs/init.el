;;; Init --- Summary
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(electric-layout-mode t)
 '(electric-pair-mode t)
 '(flx-ido-mode t)
 '(flycheck-clang-language-standard "c++11")
 '(global-flycheck-mode t nil (flycheck))
 '(global-rainbow-delimiters-mode t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(make-backup-files nil)
 '(projectile-global-mode t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
