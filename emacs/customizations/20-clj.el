(require 'paredit)
(font-lock-add-keywords
 'clojure-mode
 (mapcar
  (lambda (pair)
    `(,(car pair)
      (0 (progn (compose-region
                 (match-beginning 0) (match-end 0)
                 ,(cadr pair))
                nil))))
  '(("\\<fn\\>" ?ƒ)
    ("\\<comp\\>" ?∘)
    ("\\<partial\\>" ?þ)
    ("\\<complement\\>" ?¬))))


(add-to-list 'ac-modes 'nrepl-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)
(add-hook 'ielm-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)

