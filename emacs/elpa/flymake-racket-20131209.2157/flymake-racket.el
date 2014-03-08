;;; flymake-racket.el --- A flymake handler for scheme-mode files
;;
;;; Author: Yu Yang <yy2012cn@NOSPAM.gmail.com>
;;; URL: https://github.com/yuyang0/flymake-racket
;; Version: 20131209.2157
;;; X-Original-Version: 0.40
;;; Package-Requires: ((flymake-easy "0.1"))
;;;
;;; Commentary:
;; Usage:
;; (require 'flymake-racket)
;; (add-hook 'scheme-mode-hook 'flymake-racket-load)
;;
;; Uses flymake-easy, from https://github.com/purcell/flymake-easy

;;; Code:

(require 'flymake-easy)

(defconst flymake-racket-err-line-patterns
  '(("^\\(.*\.rkt\\):\\([0-9]+\\):\\([0-9]+\\): \\(.*\\)$" 1 2 3 4)))

(defvar flymake-racket-executable "racket"
  "The racket executable to use for syntax checking.")

;; Invoke racket with '-q -f' to get syntax checking
(defun flymake-racket-command (filename)
  "Construct a command that flymake can use to check ruby source."
  (list flymake-racket-executable "-q" "-f" filename))

;;;###autoload
(defun flymake-racket-load ()
  "Configure flymake mode to check the current buffer's ruby syntax."
  (interactive)
  (flymake-easy-load 'flymake-racket-command
                     flymake-racket-err-line-patterns
                     'tempdir
                     "rkt"))

(provide 'flymake-racket)
;;; flymake-racket.el ends here
