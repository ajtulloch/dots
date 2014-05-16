;;; Init --- Summary
;;; Commentary:
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

(provide 'init)
;;; init.el ends here
