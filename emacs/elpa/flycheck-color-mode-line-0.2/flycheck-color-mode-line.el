;;; flycheck-color-mode-line.el --- Change mode line color with Flycheck status -*- lexical-binding: t -*-
 
;; Copyright (c) 2013 Sylvain Benner <sylvain.benner@gmail.com>
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; Keywords: convenience language tools
;; Version: 0.2
;; Package-Requires: ((flycheck "0.13") (dash "1.2") (emacs "24.1"))
 
;; This file is not part of GNU Emacs.
 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
 
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
;;; Commentary:
 
;; Colorize the mode line according to the Flycheck status.
;;
;; This package provides the `flycheck-color-mode-line-mode' minor mode which
;; changes the color of the mode line according to the status of Flycheck syntax
;; checking.
;;
;; To enable this mode in Flycheck, add it to `flycheck-mode-hook':
;;
;; (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
;;
;; Thanks go to:
;; - Thomas J�rvstrand (tjarvstrand) for the initial code from the excellent
;;   EDTS package
;; - Sebastian Wiesner (lunaryorn) for flycheck and his awesome support.
 
;;; Code:
 
(require 'dash)
(require 'flycheck)
(require 'face-remap)
 
;;;; Customization
(defface flycheck-color-mode-line-error-face
  '((t :foreground "#efefef" :weight normal :inherit flycheck-fringe-error))
  "Face for the modeline in buffers with Flycheck errors."
  :group 'flycheck-faces)
 
(defface flycheck-color-mode-line-warning-face
  '((t :foreground "#efefef" :weight normal :inherit flycheck-fringe-warning))
  "Face for the modeline in buffers with only Flycheck warnings."
  :group 'flycheck-faces)

;;;; Modeline face remapping
(defvar-local flycheck-color-mode-line-cookie nil
  "Cookie for the remapped modeline face.
 
Used to restore the original mode line face.")
 
(defun flycheck-color-mode-line-reset ()
  "Reset the mode line face."
  (when flycheck-color-mode-line-cookie
    (face-remap-remove-relative flycheck-color-mode-line-cookie)
    (setq flycheck-color-mode-line-cookie nil)))
 
(defun flycheck-color-mode-line-update ()
  "Update the mode line face according to the Flycheck status."
  (flycheck-color-mode-line-reset)
  (-when-let (face (cond ((flycheck-has-current-errors-p 'error)
                          'flycheck-color-mode-line-error-face)
                         ((flycheck-has-current-errors-p 'warning)
                          'flycheck-color-mode-line-warning-face)))
    (setq flycheck-color-mode-line-cookie
          (face-remap-add-relative 'mode-line face))))
 
;;;###autoload
(define-minor-mode flycheck-color-mode-line-mode
  "Minor mode to color the mode line with the Flycheck status.
 
When called interactively, toggle
`flycheck-color-mode-line-mode'.  With prefix ARG, enable
`flycheck-color-mode-line-mode' if ARG is positive, otherwise
disable it.
 
When called from Lisp, enable `flycheck-color-mode-line-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-color-mode-line-mode'.
Otherwise behave as if called interactively."
  :init-value nil
  :keymap nil
  :lighter nil
  :group 'flycheck
  :require 'flycheck-color-mode-line
  (cond
   (flycheck-color-mode-line-mode
    (add-hook 'flycheck-after-syntax-check-hook
              #'flycheck-color-mode-line-update nil t)
    (add-hook 'flycheck-syntax-check-failed-hook
              #'flycheck-color-mode-line-reset nil t)
 
    (flycheck-color-mode-line-update))
   (:else
    (remove-hook 'flycheck-after-syntax-check-hook
                 #'flycheck-color-mode-line-update t)
    (remove-hook 'flycheck-syntax-check-failed-hook
                 #'flycheck-color-mode-line-reset t)
 
    (flycheck-color-mode-line-reset))))
 
;;;###autoload
(custom-add-frequent-value 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
 
(provide 'flycheck-color-mode-line)
 
;;; flycheck-color-mode-line.el ends here
