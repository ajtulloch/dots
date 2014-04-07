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
 '(ac-auto-start t)
 '(ac-quick-help-delay 0.5)
 '(ac-trigger-key "TAB")
 '(auto-save-default nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(electric-layout-mode t)
 '(electric-pair-mode t)
 '(flx-ido-mode t)
 '(flycheck-clang-language-standard "c++11")
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t nil (flycheck))
 '(global-rainbow-delimiters-mode t)
 '(haskell-font-lock-symbols t)
 '(haskell-stylish-on-save t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(jedi:complete-on-dot t)
 '(jedi:setup-keys t)
 '(js2-basic-offset 2)
 '(make-backup-files nil)
 '(projectile-global-mode t)
 '(py-split-windows-on-execute-p nil)
 '(scala-indent:add-space-for-scaladoc-asterisk t)
 '(scala-indent:use-javadoc-style t)
 '(scalable-fonts-allowed t)
 '(scss-compile-at-save nil)
 '(yas-global-mode t nil (yasnippet))
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
