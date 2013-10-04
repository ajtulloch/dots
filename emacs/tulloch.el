; https://sites.google.com/site/steveyegge2/effective-emacs

(defun golang-config () 
  (add-to-list 'load-path "/usr/local/go/misc/emacs" t)
  (add-to-list 'load-path "~/Code/go/src/github.com/nsf/gocode/emacs" t)
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (require 'go-mode-load)
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "\C-c\C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "\C-ci") 'go-goto-imports)))
  (add-hook 'before-save-hook 'gofmt-before-save))

(defun orgmode-config ()
  (setq org-default-notes-file "~/notes.org")
  (define-key global-map "\C-cc" 'org-capture)
  (global-set-key "\C-ca" 'org-agenda))

(defun haskell-config ()
  (add-to-list `exec-path "~/.cabal/bin")
  (autoload 'ghc-init "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode))))

(defun shortcuts-config ()
  (global-set-key "\C-x\C-m" 'execute-extended-command)
  (global-set-key "\C-c\C-m" 'execute-extended-command)
  (global-set-key "\C-w" 'backward-kill-word)
  (global-set-key "\C-x\C-k" 'kill-region)
  (global-set-key "\C-c\C-k" 'kill-region)

  (defalias 'qrr 'query-replace-regexp)
  (global-set-key [f5] 'call-last-kbd-macro))

(defun style-config ()
  (require 'color-theme-solarized)
  (color-theme-solarized-dark)
  (setq linum-format "%d ")
  (global-linum-mode))


(add-hook 'after-init-hook 
(lambda () 
  (progn
    (require 'auto-complete-config)
    (ac-config-default)
    (golang-config)
    (orgmode-config)
    (haskell-config)
    (shortcuts-config)
    (style-config))))
