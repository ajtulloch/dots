;;; packages.el --- tulloch Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq tulloch-packages
    '(
      ;; dired-details
      ;; avy
      key-chord
      swiper
      annoying-arrows-mode
      ))

;; List of packages to exclude.
(setq tulloch-excluded-packages '())

;; For each package, define a function tulloch/init-<package-name>
;;
;; (defun tulloch/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package


(defun tulloch/init-annoying-arrows-mode ()
  ""
  (use-package annoying-arrows-mode
    :init
    (global-annoying-arrows-mode)
    ;; Hack - install dired-detailsx
    (load-file "~/.emacs.d/private/tulloch/dired-details.el")
    (load-file "~/.emacs.d/private/tulloch/dired-details+.el")
    (setq dired-details-hidden-string "")
    (setq dired-use-ls-dired nil))
  )

(defun tulloch/init-swiper ()
  ""
  (use-package swiper
    :init
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)))

(defun tulloch/init-key-chord ()
  ""
  (use-package key-chord
    :init
    (require 'key-chord)
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)))
