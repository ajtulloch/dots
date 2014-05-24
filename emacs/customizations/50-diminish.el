(require 'diminish)
(eval-after-load "flyspell"
  '(diminish 'flyspell-mode))
(eval-after-load "whitespace"
  '(diminish 'global-whitespace-mode))

(diminish 'auto-complete-mode)
(diminish 'yas-minor-mode)
(diminish 'magit-auto-revert-mode)
(diminish 'paredit-mode)
(eval-after-load "flycheck"
  '(setq-default flycheck-mode-line-lighter " ✓"))

(diminish 'auto-fill-function)
