;;; Diminish --- Summary
;;; Commentary:
;;; Code:

(require 'diminish)

(eval-after-load "flyspell"
  '(diminish 'flyspell-mode))
(eval-after-load "whitespace"
  '(diminish 'global-whitespace-mode))
(eval-after-load "flycheck"
  '(setq-default flycheck-mode-line-lighter " ✓"))
(eval-after-load "smartparens"
  '(diminish 'smartparens-mode))

(eval-after-load "hi-lock"
  '(diminish 'hi-lock-mode))


(diminish 'auto-complete-mode)
(diminish 'yas-minor-mode)
(diminish 'magit-auto-revert-mode)
(diminish 'paredit-mode)
(diminish 'auto-fill-function)
(diminish 'isearch-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq mode-name "el")))

;;; 50-diminish ends here
